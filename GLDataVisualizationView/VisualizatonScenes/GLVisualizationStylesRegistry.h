//
// GLSoundVisualizationStylesRegistry.h
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


//  Different visualization styles may reqiure different data values as input.
//  For example, kGLVisualizationStyleDefault requires an NSArray with 2 NSValue-s,
//  each represents float value from 0.0 to 1.0.
//  Each visualization style class contains short description of input data.

#ifndef GLVisualizationStylesRegistry_h
#define GLVisualizationStylesRegistry_h

#define kGLVisualizationStyleDefault @"GLDefaultVisualizerScene"
#define kGLVisualizationStyleAnalogMeter @"GLAnalogMeterVisualizerScene"
#define kGLVisualizationStyleStereoAnalogMeter @"GLStereoAnalogMeterVisualizerScene"
#define kGLVisualizationStyleVUMeter @"GLVUMeterVisualizerScene"
#define kGLVisualizationStyleStereoVUMeter @"GLStereoVUMeterVisualizerScene"

#endif
