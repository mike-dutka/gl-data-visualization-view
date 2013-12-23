//
// VUPeakIndicatorMesh.h
//
// Copyright (c) 2012 Mykhaylo Dutka
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
