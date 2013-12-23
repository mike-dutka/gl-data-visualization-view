//
// GLVisualizerComplexSceneObject.m
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

#import "GLVisualizerComplexSceneObject.h"
#import "GLVisualizerComplexSceneObjectPart.h"

@interface GLVisualizerComplexSceneObject (){
    GLVisualizerComplexSceneObjectPart* rootPart;
}
@end

@implementation GLVisualizerComplexSceneObject

-(Class)rootPartClass{
    return [GLVisualizerComplexSceneObjectPart class];
}

-(void)awake
{
	rootPart = [[[self rootPartClass] alloc] init];
}

-(void)updateWithDataValue:(NSObject *)value{
    [rootPart updateWithData:value];
}

-(void)render
{
	// clear the matrix
	glPushMatrix();
	glLoadIdentity();
	
	// move to my position
	glTranslatef(self.position.x, self.position.y, self.position.z);
    
	// rotate
	glRotatef(self.rotation.x, 1.0f, 0.0f, 0.0f);
	glRotatef(self.rotation.y, 0.0f, 1.0f, 0.0f);
	glRotatef(self.rotation.z, 0.0f, 0.0f, 1.0f);
    
    //scale
	glScalef(self.scale.x, self.scale.y, self.scale.z);
	
	[rootPart renderWholeTree];
	
	//restore the matrix
	glPopMatrix();
}

-(void)dealloc{
    [rootPart release];
    [super dealloc];
}
@end
