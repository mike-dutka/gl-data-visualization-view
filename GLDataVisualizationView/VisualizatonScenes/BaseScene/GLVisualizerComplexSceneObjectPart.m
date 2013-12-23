//
// GLVisualizerComplexSceneObjectPart.m
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

#import "GLVisualizerComplexSceneObjectPart.h"

@implementation GLVisualizerComplexSceneObjectPart
@synthesize meshObject, transform, parrent, childParts, baseTransform;

- (id)init
{
    self = [super init];
    if (self) {
        meshObject = [[[self mesh] alloc] init];
        transform = [[GLTransformation alloc] init];
        
        [self buildObject];
    }
    return self;
}

-(void)buildObject{
    childParts = [[NSMutableArray alloc] init];
    
    //add child parts here if any exists
}

-(void)addChildPart:(GLVisualizerComplexSceneObjectPart *)child{
    [childParts addObject:child];
}

-(GLTransformation*)baseTransform{
    if(baseTransform == nil){
        baseTransform = [[self baseObjectTransformation] retain];
    }
    return baseTransform;
}

-(GLTransformation*)baseObjectTransformation{
    return [[[GLTransformation alloc] init] autorelease];
}

- (Class)mesh{
    return [GLVisualizerMesh class];
}

-(void)updateWithData:(NSObject*)data{
    //update transformation data
    
    //sent update data to child parts
    [childParts makeObjectsPerformSelector:@selector(updateWithData:) withObject:data];
}

-(void)renderWholeTree{
    glPushMatrix();
    [transform applyWithBase:self.baseTransform];
    [meshObject render];
    [childParts makeObjectsPerformSelector:@selector(renderWholeTree)];
    glPopMatrix();
}

-(void)dealloc{
    [meshObject release];
    [transform release];
    [baseTransform release];
    
    [parrent release];
    [childParts release];
    
    [super dealloc];
}
@end
