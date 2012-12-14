//
//  GLDefaultVisualizerScene.m
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

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
