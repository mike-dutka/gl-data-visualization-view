//
//  PlateMesh.h
//  SoundVisualizer
//
//  Created by mike-dutka on 12/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_PlateMesh_h
#define SoundVisualizer_PlateMesh_h

unsigned int plateNumVerts = 4;

float plateVerts [] = {
    0.0f,   -0.5f,
    0.0f,   0.5f,
    1.5f,   -0.5f,
    1.5f,   0.5f
};

float plateColors [] = {
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
};

float uvTexCoordinates [] = {
    0.,         187./512.,
    0.,         0.,
    280./512.,  187./512.,
    280./512.,  0
};

#endif
