//
//  GLTransformation.h
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLAdditions.h"

@interface GLTransformation : NSObject

@property (atomic, assign) GLPoint position;
@property (atomic, assign) GLRotation rotation;
@property (atomic, assign) GLScale scale;

-(void)apply;
-(void)applyWithBase:(GLTransformation*)base;
@end
