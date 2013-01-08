//
//  GLSoundVisualizationStylesRegistry.h
//  SoundVisualizer
//
//  Created by mike-dutka on 10/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//
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
