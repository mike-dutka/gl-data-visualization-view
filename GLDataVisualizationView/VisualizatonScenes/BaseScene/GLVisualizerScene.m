//
//  GLSoundLevelScene.m
//  SoundVisualizer
//
//  Created by mac-admin on 11/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLVisualizerScene.h"

@implementation GLVisualizerScene
@synthesize dataValues, sceneObjects;

-(id)init{
    self = [super init];
    if (self) {
        [self initSceneObjects];
    }
    return self;
}

-(void)initSceneObjects{
    self.sceneObjects = nil;
}

-(void)awakeSceneObjects{
    [self.sceneObjects makeObjectsPerformSelector:@selector(awake)];
}

-(void)renderSceneObjects{
    [self.sceneObjects makeObjectsPerformSelector:@selector(render)];
}

-(void)upateSceneObjects{
    int c = [self.sceneObjects count];
    if(c > 0 && c == [self.dataValues count]){
        for (int i=0; i<c; i++) {
            [self applyValue:i];
        }
    }
}

-(void)applyValue:(int)index{
    [[self.sceneObjects objectAtIndex:index] performSelector:@selector(updateWithDataValue:) withObject:[self.dataValues objectAtIndex:index]];
}

-(CGSize)requiredProjectionSize{
    return CGSizeMake(2., 1.);
}

-(void)dealloc{
    [sceneObjects release];
    [dataValues release];
    [super dealloc];
}
@end
