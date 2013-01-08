//
//  GLVUMeterVisualizerScene.m
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//
//  short input data description
//
//  float val = 0.0;
//  //0.0 <= val <= 1.0
//  NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
//  glView.dataValues = [NSArray arrayWithObject:v];

#import "GLVUMeterVisualizerScene.h"
#import "GLVUMeterVisualizerSceneObject.h"

@implementation GLVUMeterVisualizerScene
-(void)initSceneObjects{
    GLVUMeterVisualizerSceneObject* o = [[[GLVUMeterVisualizerSceneObject alloc] init] autorelease];
    o.position = GLPointAdd(o.position, -0.75, -0.5, 0.);
    
    self.sceneObjects = [NSArray arrayWithObject:o];
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(1.7, 1.);
}
@end
