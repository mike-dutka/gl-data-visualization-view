//
//  GLVisualizerMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLVisualizerMesh.h"

@implementation GLVisualizerMesh

- (id)init;
{
	self = [super init];
	if (self != nil) {
		[self initializeMesh];
	}
	return self;
}

-(void)initializeMesh{
    vertexCount = 0;
    vertexSize = 0;
    colorSize = 0;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = nil;
    vertexCount = 0;
    colors = nil;
    uvCoordinates = nil;
    
    materialName = nil;
}

// called once every frame
-(void)render
{
    if(!vertexes) return;
    
	// load arrays into the engine
	glVertexPointer(vertexSize, GL_FLOAT, 0, vertexes);
	glEnableClientState(GL_VERTEX_ARRAY);
    
    if(colors != nil){
        glColorPointer(colorSize, GL_FLOAT, 0, colors);
        glEnableClientState(GL_COLOR_ARRAY);
    }
	
    [[GLMaterialController sharedMaterialController] bindMaterial:materialName];
    if(materialName != nil){
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glTexCoordPointer(2, GL_FLOAT, 0, uvCoordinates);
    }

	//render
	glDrawArrays(renderStyle, 0, vertexCount);
}
@end
