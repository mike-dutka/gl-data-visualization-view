#import "GLDefaultVisualizerSceneObject.h"
#import "GLVisualizerSceneController.h"
#import "GLDefaultVisualizerMesh.h"

@implementation GLDefaultVisualizerSceneObject

-(Class)mesh{
    return [GLDefaultVisualizerMesh class];
}

-(void)updateWithDataValue:(NSValue *)value{
    float val = 0.;
    [value getValue:&val];
    NSAssert((val >= 0. && val <= 1.), @"Error: data value should be float value in range of 0.0 - 1.0. Current is: %f", val);
    self.scale = GLScaleMake(val, self.scale.y, self.scale.z) ;
}

@end
