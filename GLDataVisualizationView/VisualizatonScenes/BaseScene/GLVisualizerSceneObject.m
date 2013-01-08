//
//  GLSoundVisualizerSceneObject.m
//  SoundVisualizer
//
//  Created by mike-dutka on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLVisualizerSceneObject.h"
#import "GLVisualizerMesh.h"

@interface GLVisualizerSceneObject (){
    GLVisualizerMesh * mesh;
}

@end

@implementation GLVisualizerSceneObject
@synthesize position, rotation, scale;

- (id)init
{
    self = [super init];
    if (self) {
        position = GLPointMake(0., 0., 0.);
        rotation = GLRotationMake(0., 0., 0.);
        scale = GLScaleNormal();
    }
    return self;
}

/**
 * mesh object class, used for rendering 
 */
- (Class)mesh{
    return [GLVisualizerMesh class];
}

// called once when the object is first created.
-(void)awake
{
	mesh = [[[self mesh] alloc] init];
}

- (void)updateWithDataValue:(NSObject*)value{
}

// called once every frame
-(void)render
{
	// clear the matrix
	glPushMatrix();
	glLoadIdentity();
	
	// move to my position
	glTranslatef(position.x, position.y, position.z);
    
	// rotate
	glRotatef(rotation.x, 1.0f, 0.0f, 0.0f);
	glRotatef(rotation.y, 0.0f, 1.0f, 0.0f);
	glRotatef(rotation.z, 0.0f, 0.0f, 1.0f);
    
    //scale
	glScalef(scale.x, scale.y, scale.z);
	
	[mesh render];
	
	//restore the matrix
	glPopMatrix();
}

-(void)dealloc{
    [mesh release];
    [super dealloc];
}
@end
