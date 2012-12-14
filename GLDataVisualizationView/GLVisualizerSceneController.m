//
//  GGLVisualizerSceneController.m
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLVisualizerSceneController.h"
#import "GLDataVisualizationView.h"
#import "GLVisualizationStyleManager.h"

@implementation GLVisualizerSceneController

@synthesize openGLView;
@synthesize animationInterval, animationTimer;
@synthesize scene;

// Singleton accessor.  this is how you should ALWAYS get a reference
// to the scene controller.  Never init your own.
+(GLVisualizerSceneController*)sharedSceneController
{
    static GLVisualizerSceneController *sharedSceneController;
    @synchronized(self)
    {
        if (!sharedSceneController)
            sharedSceneController = [[GLVisualizerSceneController alloc] init];
	}
	return sharedSceneController;
}


#pragma mark scene preload

// this is where we initialize all our scene objects
-(void)loadScene
{
    [scene awakeSceneObjects];
}

-(void) startScene
{
	self.animationInterval = 1.0/25.0;
	[self startAnimation];
}

#pragma mark Game Loop

- (void)gameLoop
{
	// apply our inputs to the objects in the scene
	[self updateModel];
	// send our objects to the renderer
	[self renderScene];
}

- (void)updateModel
{
	// simply call 'update' on all our scene objects
    [scene upateSceneObjects];
}

- (void)renderScene
{
	// turn openGL 'on' for this frame
	[openGLView performSelector:@selector(beginDraw)];
	// simply call 'render' on all our scene objects
	[scene renderSceneObjects];
	// finalize this frame
	[openGLView performSelector:@selector(finishDraw)];
}


#pragma mark Animation Timer

// these methods are copied over from the EAGLView template

- (void)startAnimation {
	self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:animationInterval target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

- (void)stopAnimation {
	self.animationTimer = nil;
}

- (void)setAnimationTimer:(NSTimer *)newTimer {
	[animationTimer invalidate];
	animationTimer = newTimer;
}

- (void)setAnimationInterval:(NSTimeInterval)interval {
	animationInterval = interval;
	if (animationTimer) {
		[self stopAnimation];
		[self startAnimation];
	}
}

#pragma mark dealloc

- (void) dealloc
{
	[self stopAnimation];
	[super dealloc];
}


@end
