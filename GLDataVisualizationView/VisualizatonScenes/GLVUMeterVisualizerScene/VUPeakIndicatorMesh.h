//
//  VUPeakIndicatorMesh.h
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_VUPeakIndicatorMesh_h
#define SoundVisualizer_VUPeakIndicatorMesh_h

unsigned int vuPeakNumVerts = 4;

float vuPeakVerts [] = {
    0.0f,   0.0f,
    0.0f,   1.0f,
    1.0f,   0.0f,
    1.0f,   1.0f
};

float vuPeakOnColors [] = {
    1.0, 0.0, 0.0, 1.0,
    1.0, 0.0, 0.0, 1.0,
    1.0, 0.0, 0.0, 1.0,
    1.0, 0.0, 0.0, 1.0
};

float vuPeakOffColors [] = {
    0.5, 0.0, 0.0, 1.0,
    0.5, 0.0, 0.0, 1.0,
    0.5, 0.0, 0.0, 1.0,
    0.5, 0.0, 0.0, 1.0
};

float uvVUPeakTexCoordinates [] = {
    500./1024.,  25./1024.,
    500./1024.,         0.,
    525./1024.,  25./1024.,
    525./1024.,  0.
};


#endif
