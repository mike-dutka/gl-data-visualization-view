//
//  GLMaterialController.h
//  SoundVisualizer
//
//  Created by mac-admin on 13/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import "GLAdditions.h"

#define GL_REDUCE_INAGE_SIZE 0

@interface GLMaterialController : NSObject

+ (GLMaterialController*)sharedMaterialController;
- (CGSize)loadTextureImage:(NSString*)imageName materialKey:(NSString*)materialKey;
- (void)bindMaterial:(NSString*)materialKey;
- (void)bindDefaultMaterial;
- (void)loadAtlasData:(NSString*)atlas;

@end
