//
//  GLVUMeterPeakIndicatorMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import "GLVUMeterPeakIndicatorMesh.h"
#include "VUPeakIndicatorMesh.h"

@implementation GLVUMeterPeakIndicatorMesh
-(void)initializeMesh{
    vertexSize = 2;
    colorSize = 4;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = vuPeakVerts;
    vertexCount = vuPeakNumVerts;
    colors = vuPeakOffColors;
    
    materialName = @"GLVUMeterAtlas";
    uvCoordinates = uvVUPeakTexCoordinates;
}

-(void)setState:(bool)on{
    if (on) {
        colors = vuPeakOnColors;
    }else{
        colors = vuPeakOffColors;
    }
}
@end
