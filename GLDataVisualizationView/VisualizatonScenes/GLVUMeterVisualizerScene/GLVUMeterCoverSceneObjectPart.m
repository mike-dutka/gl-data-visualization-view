//
//  GLVUMeterCoverSceneObjectPart.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterCoverSceneObjectPart.h"
#import "GLVUMeterCoverMesh.h"

@implementation GLVUMeterCoverSceneObjectPart
-(Class)mesh{
    return [GLVUMeterCoverMesh class];
}
@end
