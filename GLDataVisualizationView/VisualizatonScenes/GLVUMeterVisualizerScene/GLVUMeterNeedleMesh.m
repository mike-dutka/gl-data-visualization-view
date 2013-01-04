//
//  GLVUMeterNeedleMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterNeedleMesh.h"
#include "VUNeedleMesh.h"

@implementation GLVUMeterNeedleMesh
-(void)initializeMesh{
    vertexSize = 2;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = vuNeedleVerts;
    vertexCount = vuNeedleNumVerts;
    
    uvCoordinates = uvVUNeedleTexCoordinates;
    materialName = @"GLVUMeterAtlas";
}
@end
