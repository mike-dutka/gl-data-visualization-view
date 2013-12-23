//
// GLVUMeterNeedleSceneObjectPart.m
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

#import "GLVUMeterNeedleSceneObjectPart.h"
#import "GLVUMeterNeedleMesh.h"

#define INITIAL_Y_ROTATION 40.

@implementation GLVUMeterNeedleSceneObjectPart
-(Class)mesh{
    return [GLVUMeterNeedleMesh class];
}

-(void)updateWithData:(NSObject *)data{
    float val = 0.;
    [(NSValue*)data getValue:&val];
    NSAssert((val >= 0.0 && val <= 1.0), @"Error: data value should be float value in range of 0.0 - 1.0. Current is: %.20f", val);
    
    float angle =  -val*2*INITIAL_Y_ROTATION;
    
    self.transform.rotation = GLRotationMake(0., 0., angle);
    
    [super updateWithData:data];
}

-(GLTransformation *)baseObjectTransformation{
    GLTransformation* tr = [[[GLTransformation alloc] init] autorelease];
    tr.position = GLPointMake(0.75f, 0.01f, 0.0f);
    tr.scale = GLScaleMake(0.5f, 0.71f, 1.0f);
    tr.rotation = GLRotationMake(0., 0., INITIAL_Y_ROTATION);
    return tr;
}
@end
