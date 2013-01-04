//
//  GLVUMeterPlateMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterPlateMesh.h"
#include "VUPlateMesh.h"

@implementation GLVUMeterPlateMesh
-(void)initializeMesh{
    vertexSize = 2;
    colorSize = 4;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = vuPlateVerts;
    vertexCount = vuPlateNumVerts;
    colors = vuPlateColors;
    
    materialName = @"GLVUMeterAtlas";
    uvCoordinates = uvVUPlateTexCoordinates;
}
@end
