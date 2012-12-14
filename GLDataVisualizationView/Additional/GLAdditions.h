//
//  GLAdditions.h
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    GLfloat x;
    GLfloat y;
    GLfloat z;
} GLPoint;

typedef GLPoint GLOffset;
typedef GLPoint GLTranslation;
typedef GLPoint GLRotation;
typedef GLPoint GLScale;

GLPoint GLPointMake(GLfloat x, GLfloat y, GLfloat z);

GLOffset GLOffsetMake(GLfloat dx, GLfloat dy, GLfloat dz);
GLTranslation GLTranslationMake(GLfloat x, GLfloat y, GLfloat z);
GLRotation GLRotationMake(GLfloat x, GLfloat y, GLfloat z);
GLScale GLScaleMake(GLfloat x, GLfloat y, GLfloat z);
GLScale GLScaleNormal();

GLPoint GLPointAdd(GLPoint p, GLfloat x, GLfloat y, GLfloat z);
GLPoint GLPointMultiply(GLPoint p, GLfloat x, GLfloat y, GLfloat z);
