//
//  ViewController.h
//  galileo
//
//  Created by Bo Wu on 9/11/14.
//  Copyright (c) 2014 Bo Wu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *panClockwiseButton;
@property (weak, nonatomic) IBOutlet UIButton *panAnticlockwiseButton;
@property (weak, nonatomic) IBOutlet UIButton *tiltClockwiseButton;
@property (weak, nonatomic) IBOutlet UIButton *tiltAnticlockwiseButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


-(IBAction)panClockwise:(id)sender;
-(IBAction)panAnticlockwise:(id)sender;
-(IBAction)tiltClockwise:(id)sender;
-(IBAction)tiltAnticlockwise:(id)sender;


@end
