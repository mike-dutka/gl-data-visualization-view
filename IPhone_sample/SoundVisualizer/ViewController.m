//
//  ViewController.m
//  SoundVisualizer
//
//  Created by mike-dutka on 03/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){  
    NSTimer* timer;
    Boolean directionReverse;
    NSArray* visualizationStyles;
    int visualizationIndex;
}
-(void)updatelevels;
@end

@implementation ViewController
@synthesize glView;

-(void)viewDidLoad{
    [super viewDidLoad];
    visualizationStyles = [[NSArray alloc] initWithObjects:kGLVisualizationStyleStereoVUMeter, kGLVisualizationStyleVUMeter, kGLVisualizationStyleAnalogMeter, kGLVisualizationStyleDefault, nil];
    visualizationIndex = 0;
    glView.visualizationStyle = [visualizationStyles objectAtIndex:visualizationIndex];
    glView.visualizationContentMode = GLDataVisualizationViewContentModeScaleToFit;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updatelevels) userInfo:nil repeats:YES];
}

-(void)updatelevels{
    switch (visualizationIndex) {
        case 1:{
            static float val = 0;
            val += directionReverse? -0.05f: 0.05f;
            if (val >= 1.0f || val <= 0.0f) {
                if(val > 1.) val = 1.0f;
                if(val <= 0.) val = 0.0f;
                
                directionReverse = !directionReverse;
            }
            
            NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
            glView.dataValues = [NSArray arrayWithObjects:v, nil];
        }
            break;
        default:{
            static float val = 0;
            val += directionReverse? -0.05f: 0.05f;
            if (val >= 1.0f || val <= 0.0f) {
                if(val > 1.) val = 1.0f;
                if(val <= 0.) val = 0.0f;
                
                directionReverse = !directionReverse;
            }
            
            NSValue* v = [NSValue value:&val withObjCType:@encode(float)];
            glView.dataValues = [NSArray arrayWithObjects:v, v, nil];
        }
            break;
    }
}

-(IBAction)changeStyleDidClicked:(UIButton*)btn{
    visualizationIndex = (visualizationIndex + 1) % [visualizationStyles count];
    glView.visualizationStyle = [visualizationStyles objectAtIndex:visualizationIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
