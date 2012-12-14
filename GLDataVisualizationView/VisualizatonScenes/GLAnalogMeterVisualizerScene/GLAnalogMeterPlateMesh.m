//
//  GLAnalogMeterVisualizerMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLAnalogMeterPlateMesh.h"
#import "PlateMesh.h"

@implementation GLAnalogMeterPlateMesh
-(void)initializeMesh{
    vertexSize = 2;
    colorSize = 4;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = plateVerts;
    vertexCount = plateNumVerts;
    colors = plateColors;
    
    materialName = @"GLAnalogMeterAtlas";
    uvCoordinates = uvTexCoordinates;
}
@end
