//
//  GLSoundVisualizationStyleManager.m
//  SoundVisualizer
//
//  Created by mike-dutka on 10/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "GLVisualizationStyleManager.h"

static GLVisualizationStyleManager* manager = nil;

@interface GLVisualizationStyleManager (){
    Class objectClass;
    GLVisualizerScene* scene;
}
@property (atomic, assign) Class objectClass;
@property (atomic, strong) GLVisualizerScene* scene;
@end

@implementation GLVisualizationStyleManager
@synthesize objectClass, scene;

+(GLVisualizationStyleManager*)sharedInstance{
    if(!manager){
        manager = [[GLVisualizationStyleManager alloc] init];
    }
    
    return manager;
}

+(GLVisualizerScene*)getVisualizerSceneWtihStyle:(NSString*) style{
    GLVisualizationStyleManager* m = [GLVisualizationStyleManager sharedInstance];
    
    //get channel scene object class from style string
    //look at "GLVisualizationStylesRegistry.h" to view all registered styles
    Class c = NSClassFromString(style);
    if (c == nil) {
        c = NSClassFromString(kGLVisualizationStyleDefault);
        NSAssert(c == nil, @"No scene objects were loaded. Please check the presence of GLDefaultVisualizerScene .h and .m files!");
        if(c == nil) return nil;
    }
    
    //check if need to initialize scene objects of different class
    if (m.objectClass != c) {
        m.objectClass = c;
        
        m.scene = [[[m.objectClass alloc] init] autorelease];
    }
    
    return m.scene;
}
@end
