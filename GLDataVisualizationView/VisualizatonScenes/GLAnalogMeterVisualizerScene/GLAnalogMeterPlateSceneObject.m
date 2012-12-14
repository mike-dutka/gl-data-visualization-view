//
//  GLAnalogMeterVisualizationSceneObject.m
//  SoundVisualizer
//
//  Created by mac-admin on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLAnalogMeterPlateSceneObject.h"
#import "GLAnalogMeterPlateMesh.h"

@implementation GLAnalogMeterPlateSceneObject
-(Class)mesh{
    return [GLAnalogMeterPlateMesh class];
}
@end
