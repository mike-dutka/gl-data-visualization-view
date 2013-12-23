//
// GLDataVisualizationView.h
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

#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "GLVisualizationStyleManager.h"

typedef enum{
    GLDataVisualizationViewContentModeStretch,
    GLDataVisualizationViewContentModeScaleToFit
}GLDataVisualizationViewContentMode;

typedef enum{
    GLDataVisualizationViewStateAnimationPaused,
    GLDataVisualizationViewStateAnimationPausing,
    GLDataVisualizationViewStateAnimationRunning
}GLDataVisualizationViewState;

/*
This class wraps the CAEAGLLayer from CoreAnimation into a convenient UIView subclass.
The view content is basically an EAGL surface you render your OpenGL scene into.
Note that setting the view non-opaque will only work if the EAGL surface has an alpha channel.
*/
@interface GLDataVisualizationView : UIView {
    
@private
    /* The pixel dimensions of the backbuffer */
    GLint backingWidth;
    GLint backingHeight;
    
    EAGLContext *context;
    
    /* OpenGL names for the renderbuffer and framebuffers used to render to this view */
    GLuint viewRenderbuffer, viewFramebuffer;
    
    /* OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist) */
    GLuint depthRenderbuffer;
    
    NSString* visualizationStyle;
}

/**
* array with objects depend on visualization style selected.
* audio metering visualization example:
* NSMutableArray* ma = [NSMutableArray arrayWithCapacity:2];
* AudioQueueLevelMeterState s;
* NSValue* v = [NSValue value:&s withObjCType:@encode(AudioQueueLevelMeterState)];
* [ma addObject:v];
* [ma addObject:v];
* visualizationView.dataValues = ma;
*/
@property(nonatomic, strong) NSArray* dataValues;
/**
 * selects data visualization scene type.
 * All possible types are presented in GLVisualizationStylesRegistry.h
 */
@property(atomic, strong) NSString* visualizationStyle;
@property(nonatomic, assign) GLDataVisualizationViewContentMode visualizationContentMode;

-(void)pauseVisualization;
-(void)resumeVisualization;
@end
