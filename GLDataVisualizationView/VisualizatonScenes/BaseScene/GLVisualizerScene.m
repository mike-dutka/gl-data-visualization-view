//
// GLSoundLevelScene.m
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

#import "GLVisualizerScene.h"

@implementation GLVisualizerScene
@synthesize dataValues, sceneObjects;

-(id)init{
    self = [super init];
    if (self) {
        [self initSceneObjects];
    }
    return self;
}

/**
 * anarray with scene objects should be initialized there
 */
-(void)initSceneObjects{
    self.sceneObjects = nil;
}

-(void)awakeSceneObjects{
    [self.sceneObjects makeObjectsPerformSelector:@selector(awake)];
}

-(void)renderSceneObjects{
    [self.sceneObjects makeObjectsPerformSelector:@selector(render)];
}

-(void)upateSceneObjects{
    int c = [self.sceneObjects count];
    if(c > 0 && c <= [self.dataValues count]){
        for (int i=0; i<c; i++) {
            [self applyValue:i];
        }
    }
}

-(void)applyValue:(int)index{
    [[self.sceneObjects objectAtIndex:index] performSelector:@selector(updateWithDataValue:) withObject:[self.dataValues objectAtIndex:index]];
}

/**
 * required size for projection matrix
 */
-(CGSize)requiredProjectionSize{
    return CGSizeMake(2., 1.);
}

-(void)dealloc{
    [sceneObjects release];
    [dataValues release];
    [super dealloc];
}
@end
