//
//  GLAnalogMeterVisualizationScene.m
//  SoundVisualizer
//
//  Created by mike-dutka on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//
//  short input data description
//
//  float val = 0.0;
//  //0.0 <= val <= 1.0
//  NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
//  glView.dataValues = [NSArray arrayWithObject:v];

#import "GLAnalogMeterVisualizerScene.h"
#import "GLAnalogMeterPlateSceneObject.h"
#import "GLAnalogMeterNeedleSceneObject.h"

@implementation GLAnalogMeterVisualizerScene
-(void)initSceneObjects{
    
    GLAnalogMeterPlateSceneObject *p;
    GLAnalogMeterNeedleSceneObject *n;
    
    p = [[[GLAnalogMeterPlateSceneObject alloc] init] autorelease];
    n = [[[GLAnalogMeterNeedleSceneObject alloc] init] autorelease];
    
    p.position = GLPointAdd(p.position, -0.75, 0., 0.);
    n.position = GLPointAdd(n.position, 0.0, -0.4, 0.);
    
    self.sceneObjects = [NSArray arrayWithObjects:p, n, nil];
}

-(void)upateSceneObjects{
    NSArray* values = self.dataValues;
    if([values count] == 0){
        float v = 0.;
        NSValue* val = [NSValue value:&v withObjCType:@encode(float)];
        self.dataValues = [NSArray arrayWithObjects: val, nil];
        values = self.dataValues;
    }
    
    [[self.sceneObjects objectAtIndex:1] updateWithDataValue:[values objectAtIndex:0]];
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(1.7, 1.);
}

-(void)dealloc{
    [super dealloc];
}
@end
