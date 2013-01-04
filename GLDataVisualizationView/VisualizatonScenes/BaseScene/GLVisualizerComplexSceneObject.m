//
//  GLVisualizerComplexSceneObject.m
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

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
