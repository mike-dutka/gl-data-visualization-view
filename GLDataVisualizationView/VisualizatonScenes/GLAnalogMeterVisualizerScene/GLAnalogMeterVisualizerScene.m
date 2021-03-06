//
// GLAnalogMeterVisualizationScene.m
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
//  float val = 0.0;
//  //0.0 <= val <= 1.0
//  NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
//  glView.dataValues = [NSArray arrayWithObject:v];

#import "GLAnalogMeterVisualizerScene.h"
#import "GLAnalogMeterPlateSceneObject.h"
#import "GLAnalogMeterNeedleSceneObject.h"

@implementation GLAnalogMeterVisualizerScene
-(void)initSceneObjects{
    
    GLAnalogMeterPlateSceneObject *p;
    GLAnalogMeterNeedleSceneObject *n;
    
    p = [[[GLAnalogMeterPlateSceneObject alloc] init] autorelease];
    n = [[[GLAnalogMeterNeedleSceneObject alloc] init] autorelease];
    
    p.position = GLPointAdd(p.position, -0.75, 0., 0.);
    n.position = GLPointAdd(n.position, 0.0, -0.4, 0.);
    
    self.sceneObjects = [NSArray arrayWithObjects:p, n, nil];
}

-(void)upateSceneObjects{
    NSArray* values = self.dataValues;
    if([values count] == 0){
        float v = 0.;
        NSValue* val = [NSValue value:&v withObjCType:@encode(float)];
        self.dataValues = [NSArray arrayWithObjects: val, nil];
        values = self.dataValues;
    }
    
    [[self.sceneObjects objectAtIndex:1] updateWithDataValue:[values objectAtIndex:0]];
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(1.7, 1.);
}

-(void)dealloc{
    [super dealloc];
}
@end
