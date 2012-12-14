//
//  GLStereoAnalogMeterVisualizerScene.m
//  SoundVisualizer
//
//  Created by mike-dutka on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLStereoAnalogMeterVisualizerScene.h"
#import "GLAnalogMeterPlateSceneObject.h"
#import "GLAnalogMeterNeedleSceneObject.h"

@interface GLStereoAnalogMeterVisualizerScene (){
    NSArray* plates;
    NSArray* needles;
}

@end

@implementation GLStereoAnalogMeterVisualizerScene
-(void)initSceneObjects{
    
    GLAnalogMeterPlateSceneObject *lp, *rp;
    GLAnalogMeterNeedleSceneObject *ln, *rn;
    
    
    //left channel
    lp = [[[GLAnalogMeterPlateSceneObject alloc] init] autorelease];
    ln = [[[GLAnalogMeterNeedleSceneObject alloc] init] autorelease];
    
    rp = [[[GLAnalogMeterPlateSceneObject alloc] init] autorelease];
    rn = [[[GLAnalogMeterNeedleSceneObject alloc] init] autorelease];
    
    rp.position = GLPointAdd(rp.position, 0.1, 0., 0.);
    lp.position = GLPointAdd(lp.position, -1.6, 0., 0.);
    
    ln.position = GLPointAdd(ln.position, -0.85, -0.4, 0.);
    rn.position = GLPointAdd(rn.position, 0.85, -0.4, 0.);
    
    plates = [[NSArray alloc] initWithObjects:lp, rp, nil];
    needles = [[NSArray alloc] initWithObjects:ln, rn, nil];
    
    self.sceneObjects = [NSArray arrayWithObjects:lp, rp, ln, rn, nil];
}

-(void)upateSceneObjects{
    NSArray* values = self.dataValues;
    if([values count] == 0){
        float v = 0.;
        NSValue* val = [NSValue value:&v withObjCType:@encode(float)];
        self.dataValues = [NSArray arrayWithObjects: val, val, nil];
        values = self.dataValues;
    }
    
    if([values count] != 2){
        values = [NSArray arrayWithObjects:[values objectAtIndex:0], [values objectAtIndex:0], nil];
    }
    
    for (int i=0; i<2; i++) {
        [[needles objectAtIndex:i] updateWithDataValue:[values objectAtIndex:i]];
    }
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(3.4, 1.);
}

-(void)dealloc{
    [plates release];
    [needles release];
    [super dealloc];
}
@end
