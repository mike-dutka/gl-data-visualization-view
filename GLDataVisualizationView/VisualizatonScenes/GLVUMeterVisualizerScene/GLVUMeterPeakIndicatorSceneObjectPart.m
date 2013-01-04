//
//  GLVUMeterPeakIndicatorSceneObjectPart.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterPeakIndicatorSceneObjectPart.h"
#import "GLVUMeterPeakIndicatorMesh.h"

@implementation GLVUMeterPeakIndicatorSceneObjectPart
-(Class)mesh{
    return [GLVUMeterPeakIndicatorMesh class];
}

-(void)updateWithData:(NSObject *)data{
    float val = 0.;
    [(NSValue*)data getValue:&val];
    
    [(GLVUMeterPeakIndicatorMesh*)meshObject setState:(val > 0.84f)];
    
    [super updateWithData:data];
}

-(GLTransformation *)baseObjectTransformation{
    GLTransformation* tr = [[[GLTransformation alloc] init] autorelease];
    tr.position = GLPointMake(1.2f, 0.6f, 0.0f);
    tr.scale = GLScaleMake(0.08f, 0.08f, 1.0f);
    return tr;
}
@end
