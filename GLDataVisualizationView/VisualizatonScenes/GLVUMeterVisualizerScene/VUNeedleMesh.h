//
//  VUNeedleMesh.h
//  SoundVisualizer
//
//  Created by mac-admin on 03/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#ifndef SoundVisualizer_VUNeedleMesh_h
#define SoundVisualizer_VUNeedleMesh_h

unsigned int vuNeedleNumVerts = 4	;

float vuNeedleVerts [] = {
    -0.02f,  0.0f,
    -0.02f,  1.0f,
    0.02f,   0.0f,
    0.02f,   1.0f,
};

float uvVUNeedleTexCoordinates [] = {
    465./1024,     179./1024,
    465./1024,     0.,
    471./1024.,    179./1024,
    471./1024.,    0.
};

#endif
