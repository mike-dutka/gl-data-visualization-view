//
//  GLDefaultVisualizerScene.m
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//
//  short input data description
//
//  float val1 = 0.0;
//  float val2 = 1.0;
//  //0.0 <= val1 <= 1.0
//  //0.0 <= val2 <= 1.0
//  NSValue* v1 = [NSValue value:&val1 withObjCType:@encode(float)];
//  NSValue* v2 = [NSValue value:&val2 withObjCType:@encode(float)];
//  glView.dataValues = [NSArray arrayWithObjects:v1, v2, nil];

#import "GLDefaultVisualizerScene.h"
#import "GLDefaultVisualizerSceneObject.h"

@implementation GLDefaultVisualizerScene

-(void)initSceneObjects{

    GLDefaultVisualizerSceneObject *l, *r;
    
    //left channel
    l = [[[GLDefaultVisualizerSceneObject alloc] init] autorelease];
    r = [[[GLDefaultVisualizerSceneObject alloc] init] autorelease];
    
    l.position = GLPointAdd(l.position, -0.01, 0., 0.);
    r.position = GLPointAdd(r.position, 0.01, 0., 0.);
    
    l.rotation = GLRotationMake(0., 180., 0.);
    
    self.sceneObjects = [NSArray arrayWithObjects:l, r, nil];
}

@end
