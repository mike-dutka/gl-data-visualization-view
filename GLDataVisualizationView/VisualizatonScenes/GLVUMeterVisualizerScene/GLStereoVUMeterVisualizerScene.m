//
//  GLStereoVUMeterVisualizerScene.m
//  SoundVisualizer
//
//  Created by mac-admin on 04/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLStereoVUMeterVisualizerScene.h"
#import "GLVUMeterVisualizerSceneObject.h"

@implementation GLStereoVUMeterVisualizerScene

-(void)initSceneObjects{
    GLVUMeterVisualizerSceneObject* l = [[[GLVUMeterVisualizerSceneObject alloc] init] autorelease];
    l.position = GLPointAdd(l.position, -1.6, -0.5, 0.);
    
    GLVUMeterVisualizerSceneObject* r = [[[GLVUMeterVisualizerSceneObject alloc] init] autorelease];
    r.position = GLPointAdd(r.position, 0.1, -0.5, 0.);
    
    self.sceneObjects = [NSArray arrayWithObjects:l, r, nil];
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(3.4, 1.);
}
@end
