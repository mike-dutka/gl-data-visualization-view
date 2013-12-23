//
// GLTransformation.m
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

#import "GLTransformation.h"
#import <OpenGLES/ES1/gl.h>
#import "GLAdditions.h"

@implementation GLTransformation
@synthesize position, rotation, scale;

-(id)init{
    self = [super init];
    if (self) {
        self.scale = GLScaleNormal();
    }
    return self;
}

-(void)apply{
    // move to my position
	glTranslatef(position.x, position.y, position.z);
    
	// rotate
	glRotatef(rotation.x, 1.0f, 0.0f, 0.0f);
	glRotatef(rotation.y, 0.0f, 1.0f, 0.0f);
	glRotatef(rotation.z, 0.0f, 0.0f, 1.0f);
    
    //scale
	glScalef(scale.x, scale.y, scale.z);
}

-(void)applyWithBase:(GLTransformation*)base{
    GLPoint pos = GLPointAdd(position, base.position.x, base.position.y, base.position.z);
    GLRotation rot = GLPointAdd(rotation, base.rotation.x, base.rotation.y, base.rotation.z);
    GLScale sc = GLPointMultiply(scale, base.scale.x, base.scale.y, base.scale.z);
    
    // move to my position
	glTranslatef(pos.x, pos.y, pos.z);
    
	// rotate
	glRotatef(rot.x, 1.0f, 0.0f, 0.0f);
	glRotatef(rot.y, 0.0f, 1.0f, 0.0f);
	glRotatef(rot.z, 0.0f, 0.0f, 1.0f);
    
    //scale
	glScalef(sc.x, sc.y, sc.z);
}
@end
