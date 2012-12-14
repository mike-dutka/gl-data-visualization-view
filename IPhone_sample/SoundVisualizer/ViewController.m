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
}
-(void)updatelevels;
@end

@implementation ViewController
@synthesize glView;

-(void)viewDidLoad{
    [super viewDidLoad];
    glView.visualizationStyle = kGLVisualizationStyleAnalogMeter;
    glView.visualizationContentMode = GLDataVisualizationViewContentModeScaleToFit;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updatelevels) userInfo:nil repeats:YES];
}

-(void)updatelevels{
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

-(IBAction)changeStyleDidClicked:(UIButton*)btn{
    if(glView.visualizationStyle == kGLVisualizationStyleAnalogMeter){
        glView.visualizationStyle = kGLVisualizationStyleDefault;
    }else{
        glView.visualizationStyle = kGLVisualizationStyleAnalogMeter;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
