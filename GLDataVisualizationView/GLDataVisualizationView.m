//
//  GLDataVisualizationView.m
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>
#import "GLDataVisualizationView.h"
#import "GLVisualizerSceneController.h"

#define USE_DEPTH_BUFFER 1

// A class extension to declare private methods
@interface GLDataVisualizationView (){
    GLVisualizerSceneController* sceneController;
}

@property (nonatomic, retain) EAGLContext *context;
-(id)initializeView;
- (void)beginDraw;
- (void)finishDraw;
- (void)setupView;
- (BOOL) createFramebuffer;
- (void) destroyFramebuffer;
-(void)perspectiveFovY:(GLfloat)fovY
                aspect:(GLfloat)aspect
                 zNear:(GLfloat)zNear
                  zFar:(GLfloat)zFar;
@end


@implementation GLDataVisualizationView

@synthesize context;
@dynamic dataValues;
@dynamic visualizationStyle;
@synthesize visualizationContentMode;


// You must implement this method
+ (Class)layerClass {
    return [CAEAGLLayer class];
}


// The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithFrame:(CGRect)rect {
    self = [super initWithFrame:rect];
    return [self initializeView];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return [self initializeView];
}

-(id)initializeView{
    // Get the layer
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
    
    eaglLayer.opaque = YES;
    eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
    
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
    
    if (!context || ![EAGLContext setCurrentContext:context]) {
        [self release];
        return nil;
    }
    
    sceneController = [GLVisualizerSceneController sharedSceneController];
    sceneController.openGLView = self;
    sceneController.scene = [GLVisualizationStyleManager getVisualizerSceneWtihStyle:self.visualizationStyle];
    return self;
}

-(void)didMoveToWindow{
    if (self.window) {
        [sceneController loadScene];
        [sceneController startScene];
    }
}

- (void)setupView
{
	// Set up the window that we will view the scene through
	glViewport(0, 0, backingWidth, backingHeight);
	
	// switch to the projection matrix and setup our 'camera lens'
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	//
    if (self.visualizationContentMode == GLDataVisualizationViewContentModeScaleToFit) {
        float height = 0.;
        float width = 0.;
        
        CGSize required = sceneController.scene.requiredProjectionSize;
        float requiredRatio = required.width/required.height;
        CGSize viewSize = self.frame.size;
        float viewRatio = viewSize.width/viewSize.height;
        
        if (requiredRatio > viewRatio) {
            width = required.width;
            height = required.height * requiredRatio/viewRatio;
        }else{
            height = required.height;
            width = required.width * (viewRatio/requiredRatio);
        }
        glOrthof(-width/2., width/2., -height/2., height/2., -1.0f, 1.0f);
    }else{
        glOrthof(-1.0f, 1.0f, -0.5f, 0.5f, -1.0f, 1.0f);
    }
    
    //[self perspectiveFovY:45.f aspect:320.f/480.f zNear:0.001f zFar:100.f];

	// switch to model mode and set our background color
	glMatrixMode(GL_MODELVIEW);
    
    //get bg  RGB color components
    CGFloat bgRed;
    CGFloat bgGreen;
    CGFloat bgBlue;
    CGFloat bgAlpha;
    int c = CGColorGetNumberOfComponents(self.backgroundColor.CGColor);
    const CGFloat* components = CGColorGetComponents(self.backgroundColor.CGColor);
    if (c == 2) {
        bgRed = components[0];
        bgGreen = bgRed;
        bgBlue = bgRed;
        bgAlpha = components[1];
    } else {
        bgRed = components[0];
        bgGreen = components[1];
        bgBlue = components[2];
        bgAlpha = components[3];
    }
    
	glClearColor(bgRed, bgGreen, bgBlue, bgAlpha);
}

-(void)beginDraw
{
	// Make sure that you are drawing to the current context
	[EAGLContext setCurrentContext:context];
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	// make sure we are in model matrix mode and clear the frame
	glMatrixMode(GL_MODELVIEW);
	glClear(GL_COLOR_BUFFER_BIT);
	// set a clean transform
	glLoadIdentity();
}

-(void)finishDraw
{
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];	
}

- (void)layoutSubviews 
{
	[EAGLContext setCurrentContext:context];
	[self destroyFramebuffer];
	[self createFramebuffer];
	[self setupView];
}

- (BOOL)createFramebuffer {    
    glGenFramebuffersOES(1, &viewFramebuffer);
    glGenRenderbuffersOES(1, &viewRenderbuffer);
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer*)self.layer];
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
    
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
    
    if (USE_DEPTH_BUFFER) {
        glGenRenderbuffersOES(1, &depthRenderbuffer);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
        glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
    }
    
    if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES) {
        NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }
    
    return YES;
}


- (void)destroyFramebuffer {
    
    glDeleteFramebuffersOES(1, &viewFramebuffer);
    viewFramebuffer = 0;
    glDeleteRenderbuffersOES(1, &viewRenderbuffer);
    viewRenderbuffer = 0;
    
    if(depthRenderbuffer) {
        glDeleteRenderbuffersOES(1, &depthRenderbuffer);
        depthRenderbuffer = 0;
    }
}


-(void)perspectiveFovY:(GLfloat)fovY 
								aspect:(GLfloat)aspect 
								 zNear:(GLfloat)zNear
									zFar:(GLfloat)zFar 
{
	const GLfloat pi = 3.1415926;
	//	Half of the size of the x and y clipping planes.
	// - halfWidth = left, halfWidth = right
	// - halfHeight = bottom, halfHeight = top
	GLfloat halfWidth, halfHeight;
	//	Calculate the distance from 0 of the y clipping plane. Basically trig to calculate
	//	position of clip plane at zNear.
	halfHeight = tan( (fovY / 2) / 180 * pi ) * zNear;	
	//	Calculate the distance from 0 of the x clipping plane based on the aspect ratio.
	halfWidth = halfHeight * aspect;
	//	Finally call glFrustum with our calculated values.
	glFrustumf( -halfWidth, halfWidth, -halfHeight, halfHeight, zNear, zFar );
}

-(void)setDataValues:(NSArray *)dataValues{
    @synchronized(sceneController){
        sceneController.scene.dataValues = dataValues;
    }
}

-(NSArray *)dataValues{
    @synchronized(sceneController){
        if(sceneController.scene.dataValues == nil){
            //deafult dataValues initialization
            NSMutableArray* ma = [NSMutableArray arrayWithCapacity:2];
            float val = 0.0;
            NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
            [ma addObject:v];
            [ma addObject:v];
            
            sceneController.scene.dataValues = [NSArray arrayWithArray:ma];
        }
    }
    return sceneController.scene.dataValues;
}

-(void)setVisualizationStyle:(NSString *)style{
    if(![visualizationStyle isEqualToString:style]){
        @synchronized(sceneController){
            [visualizationStyle release];
            visualizationStyle = [style copy];
            
            [sceneController stopAnimation];
            sceneController.scene = [GLVisualizationStyleManager getVisualizerSceneWtihStyle:visualizationStyle];
            
            [self setNeedsLayout];
            
            [sceneController loadScene];
            [sceneController startScene];
        }
    }
}

-(NSString *)visualizationStyle{
    if(visualizationStyle == nil) visualizationStyle = kGLVisualizationStyleDefault;
    @synchronized(visualizationStyle){
        return visualizationStyle;
    }
}

- (void)dealloc {
    
    if ([EAGLContext currentContext] == context) {
        [EAGLContext setCurrentContext:nil];
    }
    
    [context release];  
    [super dealloc];
}

@end
