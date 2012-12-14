//
//  GLMaterialController.m
//  SoundVisualizer
//
//  Created by mike-dutka on 13/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLMaterialController.h"

@interface GLMaterialController (){
    NSMutableDictionary * materialLibrary;
    NSString* atlasName;
    CGSize atlasSize;
}

@end

@implementation GLMaterialController
+(GLMaterialController*)sharedMaterialController
{
    static GLMaterialController *sharedMaterialController;
    @synchronized(self)
    {
        if (!sharedMaterialController){
            sharedMaterialController = [[GLMaterialController alloc] init];
        }
		
        return sharedMaterialController;
    }
}

-(void)loadAtlasData:(NSString*)atlas
{
    if([atlas isEqualToString:self->atlasName]) return;
    
	NSAutoreleasePool * apool = [[NSAutoreleasePool alloc] init];
	
    [self->atlasName release];
    self->atlasName = [atlas copy];
    
	atlasSize = [self loadTextureImage:[self->atlasName stringByAppendingPathExtension:@"png"] materialKey:self->atlasName];
    
	[apool release];
}

// grabs the openGL texture ID from the library and calls the openGL bind texture method
-(void)bindMaterial:(NSString*)materialKey
{
    if(materialKey == nil){
        glDisable(GL_TEXTURE_2D);
        return;
    }
    
	NSNumber * numberObj = [materialLibrary objectForKey:materialKey];
	if (numberObj == nil){                                                      //material is not loaded into the library
        [self loadAtlasData:materialKey];                                       //try to load atlas
        if(!(numberObj = [materialLibrary objectForKey:materialKey])) return;   //no atlas file for specified material key found
    }
    
	GLuint textureID = [numberObj unsignedIntValue];
	
    glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, textureID);
}

- (void)bindDefaultMaterial{
    //check if any material is already loaded
    NSArray* keys = [materialLibrary allKeys];
    if ([keys count] > 0) {
        [self bindMaterial:[keys objectAtIndex:0]];
    }
}

// does the heavy lifting for getting a named image into a texture
// that is loaded into openGL
// this is a modified version of the way Apple loads textures in their sample code
-(CGSize)loadTextureImage:(NSString*)imageName materialKey:(NSString*)materialKey
{
	CGContextRef spriteContext; //context ref for the UIImage
	GLubyte *spriteData; // a temporary buffer to hold our image data
	size_t	width, height;
	GLuint textureID; // the ultimate ID for this texture
	// grab the image off the file system, jam it into a CGImageRef
	
	UIImage*	uiImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:nil]];
	CGImageRef spriteImage = [uiImage CGImage];
	// Get the width and height of the image
	width = CGImageGetWidth(spriteImage);
	height = CGImageGetHeight(spriteImage);
	
	CGSize imageSize = CGSizeMake(width, height);
	// Texture dimensions must be a power of 2. If you write an application that allows users to supply an image,
	// you'll want to add code that checks the dimensions and takes appropriate action if they are not a power of 2.
	
	if (spriteImage) {
		// Allocated memory needed for the bitmap context
		spriteData = (GLubyte *) malloc(width * height * 4);
		memset(spriteData, 0, (width * height * 4));
		// Uses the bitmatp creation function provided by the Core Graphics framework.
		spriteContext = CGBitmapContextCreate(spriteData, width, height, 8, width * 4, CGImageGetColorSpace(spriteImage), kCGImageAlphaPremultipliedLast);
		// After you create the context, you can draw the sprite image to the context.
		CGContextDrawImage(spriteContext, CGRectMake(0.0, 0.0, (CGFloat)width, (CGFloat)height), spriteImage);
		// You don't need the context at this point, so you need to release it to avoid memory leaks.
		CGContextRelease(spriteContext);
		
		// Use OpenGL ES to generate a name for the texture.
		glGenTextures(1, &textureID);
		// Bind the texture name.
		glBindTexture(GL_TEXTURE_2D, textureID);
		// Specidfy a 2D texture image, provideing the a pointer to the image data in memory
		
		//Convert "RRRRRRRRRGGGGGGGGBBBBBBBBAAAAAAAA" to "RRRRRGGGGBBBBAAAA"
		// this will make your images take up half as much space in memory
		// but you will lose half of your color depth.
		if (GL_REDUCE_INAGE_SIZE) {
			void*					tempData;
			unsigned int*			inPixel32;
			unsigned short*			outPixel16;
			
			tempData = malloc(height * width * 2);
			
			inPixel32 = (unsigned int*)spriteData;
			outPixel16 = (unsigned short*)tempData;
			NSUInteger i;
			for(i = 0; i < width * height; ++i, ++inPixel32)
				*outPixel16++ = ((((*inPixel32 >> 0) & 0xFF) >> 4) << 12) | ((((*inPixel32 >> 8) & 0xFF) >> 4) << 8) | ((((*inPixel32 >> 16) & 0xFF) >> 4) << 4) | ((((*inPixel32 >> 24) & 0xFF) >> 4) << 0);
			
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_SHORT_4_4_4_4, tempData);
			free(tempData);
		} else {
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, spriteData);
		}
		
		free(spriteData);
		// Release the image data
        
        //glTexEnvf( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_DECAL);
		// Set the texture parameters to use a minifying filter and a linear filer (weighted average)
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        
		// Enable use of the texture
		glEnable(GL_TEXTURE_2D);
		// Set a blending function to use
		glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
		// Enable blending
		glEnable(GL_BLEND);
	} else {
		return CGSizeZero;
	}
	[uiImage release];
	
	if (materialLibrary == nil) materialLibrary = [[NSMutableDictionary alloc] init];
	
	// now put the texture ID into the library
	[materialLibrary setObject:[NSNumber numberWithUnsignedInt:textureID] forKey:materialKey];
	return imageSize;
}

@end
