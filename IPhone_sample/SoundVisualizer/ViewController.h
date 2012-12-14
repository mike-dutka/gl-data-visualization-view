//
//  ViewController.h
//  SoundVisualizer
//
//  Created by mac-admin on 03/12/2012.
//  Copyright (c) 2012 Mike Dutka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GLDataVisualizationView.h"

@interface ViewController : UIViewController{
    IBOutlet GLDataVisualizationView* glView;
}
@property(nonatomic, strong) GLDataVisualizationView* glView;

-(IBAction)changeStyleDidClicked:(UIButton*)btn;
@end
