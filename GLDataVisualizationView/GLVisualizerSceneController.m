//
// GGLVisualizerSceneController.m
//
// Copyright (c) 2012 Mykhaylo Dutka
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
	animationInterval = 1.0/25.0;
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
