//
//  GLSoundVisualizerSceneObject.h
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import "GLAdditions.h"

@interface GLVisualizerSceneObject : NSObject

@property (atomic, assign) GLPoint position;
@property (atomic, assign) GLRotation rotation;
@property (atomic, assign) GLScale scale;

- (void)awake;
- (void)render;
- (void)updateWithDataValue:(NSValue*)value;
- (Class)mesh;
@end
