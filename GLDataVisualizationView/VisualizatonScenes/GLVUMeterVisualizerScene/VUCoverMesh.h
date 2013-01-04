//
//  VUCoverMesh.h
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_VUCoverMesh_h
#define SoundVisualizer_VUCoverMesh_h

unsigned int vuCoverNumVerts = 4;

float vuCoverVerts [] = {
    0.0f,   0.0f,
    0.0f,   1.0f,
    1.5f,   0.0f,
    1.5f,   1.0f
};

float vuCoverColors [] = {
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
};

float uvVUCoverTexCoordinates [] = {
    0.,         610./1024.,
    0.,         305./1024.,
    458./1024., 610./1024.,
    458./1024., 305./1024.
};

#endif
