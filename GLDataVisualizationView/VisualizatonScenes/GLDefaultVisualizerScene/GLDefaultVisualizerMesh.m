//
//  GLDefaultVisualizerMesh.m
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLDefaultVisualizerMesh.h"
#import "DefaultMesh.h"

@implementation GLDefaultVisualizerMesh
-(void)initializeMesh{
    vertexCount = 0;
    vertexSize = 2;
    colorSize = 4;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = channelVerts;
    vertexCount = channelNumVerts;
    colors = channelColors;
}
@end
