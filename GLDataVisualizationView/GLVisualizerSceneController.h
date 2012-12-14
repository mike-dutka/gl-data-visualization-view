//
//  GGLVisualizerSceneController.h
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLVisualizerScene.h"

@class GLDataVisualizationView;

@interface GLVisualizerSceneController : NSObject {
	GLVisualizerScene* scene;
	
	GLDataVisualizationView * openGLView;
	
	NSTimer *animationTimer;
	NSTimeInterval animationInterval;
}

@property (retain) GLDataVisualizationView * openGLView;
@property (atomic, strong) GLVisualizerScene* scene; 

@property (nonatomic, assign) NSTimeInterval animationInterval;
@property (nonatomic, assign) NSTimer *animationTimer;

+ (GLVisualizerSceneController*)sharedSceneController;
- (void) dealloc;
- (void) loadScene;
- (void) startScene;
- (void)gameLoop;
- (void)renderScene;
- (void)setAnimationInterval:(NSTimeInterval)interval ;
- (void)setAnimationTimer:(NSTimer *)newTimer ;
- (void)startAnimation ;
- (void)stopAnimation ;
- (void)updateModel;

@end
