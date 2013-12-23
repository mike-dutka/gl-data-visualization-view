//
// GLVisualizerMesh.m
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

#import "GLVisualizerMesh.h"

@implementation GLVisualizerMesh

- (id)init;
{
	self = [super init];
	if (self != nil) {
		[self initializeMesh];
	}
	return self;
}

-(void)initializeMesh{
    vertexCount = 0;
    vertexSize = 0;
    colorSize = 0;
    renderStyle = GL_TRIANGLE_STRIP;
    
    vertexes = nil;
    vertexCount = 0;
    colors = nil;
    uvCoordinates = nil;
    
    materialName = nil;
}

// called once every frame
-(void)render
{
    if(!vertexes) return;
    
	// load arrays into the engine
	glVertexPointer(vertexSize, GL_FLOAT, 0, vertexes);
	glEnableClientState(GL_VERTEX_ARRAY);
    
    if(colors != nil){
        glColorPointer(colorSize, GL_FLOAT, 0, colors);
        glEnableClientState(GL_COLOR_ARRAY);
    }
	
    [[GLMaterialController sharedMaterialController] bindMaterial:materialName];
    if(materialName != nil){
        glEnableClientState(GL_TEXTURE_COORD_ARRAY);
        glTexCoordPointer(2, GL_FLOAT, 0, uvCoordinates);
    }

	//render
	glDrawArrays(renderStyle, 0, vertexCount);
}
@end
