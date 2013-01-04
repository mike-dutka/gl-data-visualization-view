//
//  PlateMesh.h
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_VUPlateMesh_h
#define SoundVisualizer_VUPlateMesh_h

unsigned int vuPlateNumVerts = 4;

float vuPlateVerts [] = {
    0.0f,   0.0f,
    0.0f,   1.0f,
    1.5f,   0.0f,
    1.5f,   1.0f
};

float vuPlateColors [] = {
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
    1.0, 1.0, 1.0, 1.0,
};

float uvVUPlateTexCoordinates [] = {
    0.,             305./1024.,
    0.,             0.,
    458./1024.,     305./1024.,
    458./1024.,     0.
};

#endif
