//
//  GLVisualizerComplexSceneObjectPart.h
//  SoundVisualizer
//
//  Created by mac-admin on 02/01/2013.
//  Copyright (c) 2013 Mike Dutka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLVisualizerMesh.h"
#import "GLTransformation.h"

@interface GLVisualizerComplexSceneObjectPart : NSObject{
    @protected
    GLVisualizerMesh* meshObject;
    GLTransformation* transform;
    GLTransformation* baseTransform;
    
    //tree fields
    GLVisualizerComplexSceneObjectPart* parrent;
    NSMutableArray* childParts;
}
@property (nonatomic, strong, readonly) GLVisualizerMesh* meshObject;
@property (nonatomic, strong, readonly) GLTransformation* transform;
@property (nonatomic, strong, readonly) GLTransformation* baseTransform;

@property (nonatomic, strong) GLVisualizerComplexSceneObjectPart* parrent;
@property (nonatomic, strong) NSArray* childParts;

-(void)updateWithData:(NSObject*)data;
-(void)renderWholeTree;
-(void)buildObject;
-(void)addChildPart:(GLVisualizerComplexSceneObjectPart*)child;
- (Class)mesh;
-(GLTransformation*)baseObjectTransformation;
@end
