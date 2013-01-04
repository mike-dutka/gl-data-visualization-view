//
//  GLVUMeterVisualizerSceneObject.m
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterVisualizerSceneObject.h"
#import "GLVUMeterPlateSceneObjectPart.h"

#define INITIAL_Y_ROTATION 52.

@implementation GLVUMeterVisualizerSceneObject
-(Class)rootPartClass{
    return [GLVUMeterPlateSceneObjectPart class];
}

@end
