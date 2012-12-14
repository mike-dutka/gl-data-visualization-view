//
//  GLAdditions.c
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLAdditions.h"

GLPoint GLPointMake(GLfloat x, GLfloat y, GLfloat z){
    GLPoint p;
    p.x = x;
    p.y = y;
    p.z = z;
    
    return p;
}

GLOffset GLOffsetMake(GLfloat dx, GLfloat dy, GLfloat dz){
    return GLPointMake(dx, dy, dz);
}

GLTranslation GLTranslationMake(GLfloat x, GLfloat y, GLfloat z){
    return GLPointMake(x, y, z);
}

GLRotation GLRotationMake(GLfloat x, GLfloat y, GLfloat z){
    return GLPointMake(x, y, z);
}

GLScale GLScaleMake(GLfloat x, GLfloat y, GLfloat z){
    return GLPointMake(x, y, z);
}

GLScale GLScaleNormal(){
    return GLPointMake(1.0, 1.0, 1.0);
}


GLPoint GLPointAdd(GLPoint p, GLfloat x, GLfloat y, GLfloat z){
    GLPoint r;
    r.x = p.x + x;
    r.y = p.y + y;
    r.z = p.z + z;
    
    return r;
}

GLPoint GLPointMultiply(GLPoint p, GLfloat x, GLfloat y, GLfloat z){
    GLPoint r;
    r.x = p.x * x;
    r.y = p.y * y;
    r.z = p.z * z;
    
    return r;
}