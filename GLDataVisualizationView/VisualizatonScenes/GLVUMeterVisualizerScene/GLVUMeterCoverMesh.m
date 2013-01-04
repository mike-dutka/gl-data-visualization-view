//
//  GLVUMeterCoverMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterCoverMesh.h"
#include "VUCoverMesh.h"

@implementation GLVUMeterCoverMesh
-(void)initializeMesh{
    vertexSize = 2;
    colorSize = 4;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = vuCoverVerts;
    vertexCount = vuCoverNumVerts;
    colors = vuCoverColors;
    
    materialName = @"GLVUMeterAtlas";
    uvCoordinates = uvVUCoverTexCoordinates;
}
@end
