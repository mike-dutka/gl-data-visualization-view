//
//  GLVUMeterNeedleSceneObjectPart.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterNeedleSceneObjectPart.h"
#import "GLVUMeterNeedleMesh.h"

#define INITIAL_Y_ROTATION 40.

@implementation GLVUMeterNeedleSceneObjectPart
-(Class)mesh{
    return [GLVUMeterNeedleMesh class];
}

-(void)updateWithData:(NSObject *)data{
    float val = 0.;
    [(NSValue*)data getValue:&val];
    NSAssert((val >= 0.0 && val <= 1.0), @"Error: data value should be float value in range of 0.0 - 1.0. Current is: %.20f", val);
    
    float angle = INITIAL_Y_ROTATION * (1 - 2 * val);
    if(angle < 0)angle += 360.;
    
    self.transform.rotation = GLRotationMake(0., 0., angle);
    
    [super updateWithData:data];
}

-(GLTransformation *)baseObjectTransformation{
    GLTransformation* tr = [[[GLTransformation alloc] init] autorelease];
    tr.position = GLPointMake(0.75f, 0.01f, 0.0f);
    tr.scale = GLScaleMake(0.5f, 0.71f, 1.0f);
    return tr;
}
@end
