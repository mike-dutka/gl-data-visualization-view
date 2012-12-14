//
//  GLSoundLevelScene.h
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLVisualizerScene : NSObject

@property (atomic, strong) NSArray* sceneObjects;
@property (atomic, strong) NSArray* dataValues;

-(void)awakeSceneObjects;
-(void)renderSceneObjects;
-(void)upateSceneObjects;
-(void)initSceneObjects;
-(void)applyValue:(int)index;

-(CGSize)requiredProjectionSize;
@end
