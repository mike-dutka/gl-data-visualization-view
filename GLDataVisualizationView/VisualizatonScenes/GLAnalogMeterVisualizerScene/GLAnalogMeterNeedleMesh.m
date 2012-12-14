//
//  GLAnalogMeterNeedleMesh.m
//  SoundVisualizer
//
//  Created by mac-admin on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLAnalogMeterNeedleMesh.h"
#import "NeedleMesh.h"

@implementation GLAnalogMeterNeedleMesh
-(void)initializeMesh{
    vertexSize = 2;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = needleVerts;
    vertexCount = needleNumVerts;
        
    uvCoordinates = uvNeedleCoordinates;
    materialName = @"GLAnalogMeterAtlas";
}
@end
