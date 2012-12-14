//
//  GLVisualizerMesh.h
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import "GLMaterialController.h"

@interface GLVisualizerMesh : NSObject {
	// mesh data
	GLfloat * vertexes;
	GLfloat * colors;
    GLfloat * uvCoordinates;
	
	GLenum renderStyle;
	NSInteger vertexCount;
	NSInteger vertexSize;
	NSInteger colorSize;
	
    NSString* materialName;
}

-(void)initializeMesh;

-(void)render;

@end
