//
// GLSoundVisualizationStyleManager.m
//
// Copyright (c) 2012 Mykhaylo Dutka
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
