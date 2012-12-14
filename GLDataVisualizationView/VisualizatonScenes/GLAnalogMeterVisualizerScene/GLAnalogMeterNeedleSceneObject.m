//
//  GLAnalogMeterNeedleSceneObject.m
//  SoundVisualizer
//
//  Created by mike-dutka on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLAnalogMeterNeedleSceneObject.h"
#import "GLAnalogMeterNeedleMesh.h"

#define INITIAL_Y_ROTATION 50.

@implementation GLAnalogMeterNeedleSceneObject

-(Class)mesh{
    return [GLAnalogMeterNeedleMesh class];
}

-(void)updateWithDataValue:(NSValue *)value{
    float val = 0.;
    [value getValue:&val];
    NSAssert((val >= 0.0 && val <= 1.0), @"Error: data value should be float value in range of 0.0 - 1.0. Current is: %.20f", val);
    
    float angle = INITIAL_Y_ROTATION * (1 - 2 * val);
    if(angle < 0)angle += 360.;
    
    self.rotation = GLRotationMake(0., 0., angle);
}
@end
