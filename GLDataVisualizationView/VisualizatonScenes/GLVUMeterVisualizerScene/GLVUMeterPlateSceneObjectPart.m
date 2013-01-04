//
//  GLVUMeterPlateSceneObjectPart.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterPlateSceneObjectPart.h"
#import "GLVUMeterPlateMesh.h"

#import "GLVUMeterNeedleSceneObjectPart.h"
#import "GLVUMeterPeakIndicatorSceneObjectPart.h"
#import "GLVUMeterCoverSceneObjectPart.m"

@implementation GLVUMeterPlateSceneObjectPart
-(Class)mesh{
    return [GLVUMeterPlateMesh class];
}

-(void)buildObject{
    [super buildObject];
    
    [self addChildPart:[[[GLVUMeterNeedleSceneObjectPart alloc] init] autorelease]];
    [self addChildPart:[[[GLVUMeterPeakIndicatorSceneObjectPart alloc] init] autorelease]];
    [self addChildPart:[[[GLVUMeterCoverSceneObjectPart alloc] init] autorelease]];
}
@end
