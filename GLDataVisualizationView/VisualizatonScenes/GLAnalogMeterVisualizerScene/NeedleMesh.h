//
//  NeedleMesh.h
//  SoundVisualizer
//
//  Created by mike-dutka on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_NeedleMesh_h
#define SoundVisualizer_NeedleMesh_h

unsigned int needleNumVerts = 4	;

float needleVerts [] = {
    -0.02f,  0.0f,
    -0.02f,  0.65f,
    0.02f,   0.0f,
    0.02f,   0.65f,
};

float uvNeedleCoordinates [] = {
    0.001,         0.999,
    0.001,         382./512,
    5./512.,    0.999,
    5./512.,    382./512.
};

#endif
