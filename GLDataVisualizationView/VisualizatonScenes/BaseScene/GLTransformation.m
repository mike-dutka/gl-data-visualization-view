//
//  GLTransformation.m
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

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
