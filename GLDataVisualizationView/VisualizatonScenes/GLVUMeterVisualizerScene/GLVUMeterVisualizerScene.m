//
//  GLVUMeterVisualizerScene.m
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

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
