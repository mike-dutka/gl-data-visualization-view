//
// GLDefaultVisualizerScene.m
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


//  short input data description
//
//  float val1 = 0.0;
//  float val2 = 1.0;
//  //0.0 <= val1 <= 1.0
//  //0.0 <= val2 <= 1.0
//  NSValue* v1 = [NSValue value:&val1 withObjCType:@encode(float)];
//  NSValue* v2 = [NSValue value:&val2 withObjCType:@encode(float)];
//  glView.dataValues = [NSArray arrayWithObjects:v1, v2, nil];

#import "GLDefaultVisualizerScene.h"
#import "GLDefaultVisualizerSceneObject.h"

@implementation GLDefaultVisualizerScene

-(void)initSceneObjects{

    GLDefaultVisualizerSceneObject *l, *r;
    
    //left channel
    l = [[[GLDefaultVisualizerSceneObject alloc] init] autorelease];
    r = [[[GLDefaultVisualizerSceneObject alloc] init] autorelease];
    
    l.position = GLPointAdd(l.position, -0.01, 0., 0.);
    r.position = GLPointAdd(r.position, 0.01, 0., 0.);
    
    l.rotation = GLRotationMake(0., 180., 0.);
    
    self.sceneObjects = [NSArray arrayWithObjects:l, r, nil];
}

@end
