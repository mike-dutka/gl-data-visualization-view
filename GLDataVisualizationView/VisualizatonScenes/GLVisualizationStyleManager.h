//
//  GLSoundVisualizationStyleManager.h
//  SoundVisualizer
//
//  Created by mac-admin on 10/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLVisualizationStylesRegistry.h"
#import "GLVisualizerScene.h"

@interface GLVisualizationStyleManager : NSObject

+(GLVisualizationStyleManager*)sharedInstance;

+(GLVisualizerScene*)getVisualizerSceneWtihStyle:(NSString*) style;

@end
