//
//  ViewController.m
//  galileo
//
//  Created by Bo Wu on 9/11/14.
//  Copyright (c) 2014 Bo Wu. All rights reserved.
//

#import "ViewController.h"
#import <GalileoControl/GalileoControl.h>

@interface ViewController () <GCGalileoDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [GCGalileo sharedGalileo].delegate = self;
    [[GCGalileo sharedGalileo] waitForConnection];
}


- (void) galileoDidConnect
{
    UIAlertView* galileoConnectedAlert = [[UIAlertView alloc] initWithTitle:@"Galileo connected!"
                                                                        message:nil
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
    [galileoConnectedAlert show];
}

/*
- (void) galileoDidConnect
{
    GCPositionControl* panPositionControl = [[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisPan];
    [panPositionControl incrementTargetPosition:90.0 notifyDelegate:nil waitUntilStationary:NO];
}
*/
- (void) galileoDidDisconnect
{
    [[GCGalileo sharedGalileo] waitForConnection];
}


-(IBAction)panClockwise:(id)sender{
    /*
    void (^completionBlock) (BOOL) = ^(BOOL wasCommandPreempted)
    {
        if (!wasCommandPreempted) [self controlDidReachTargetPosition];
    };
    [[[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisPan] incrementTargetPosition:360
                                                                                 completionBlock:completionBlock waitUntilStationary:NO];
     */
    
    GCPositionControl* panPositionControl = [[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisPan];
    [panPositionControl incrementTargetPosition:360.0 notifyDelegate:nil waitUntilStationary:NO];
}


-(IBAction)panAnticlockwise:(id)sender{
    /*
    void (^completionBlock) (BOOL) = ^(BOOL wasCommandPreempted)
    {
        if (!wasCommandPreempted) [self controlDidReachTargetPosition];
    };
    [[[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisPan] incrementTargetPosition:-360
                                                                                 completionBlock:completionBlock
                                                                             waitUntilStationary:NO];
    */
    
    //GCVelocityControl* tiltVelocityControl = [[GCGalileo sharedGalileo] velocityControlForAxis:GCControlAxisTilt];
    //[tiltVelocityControl setTargetVelocity:200.0];
    GCPositionControl* panPositionControl = [[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisPan];
    [panPositionControl incrementTargetPosition:-360.0 notifyDelegate:nil waitUntilStationary:NO];
}


-(IBAction)tiltClockwise:(id)sender{
    void (^completionBlock) (BOOL) = ^(BOOL wasCommandPreempted)
    {
        if (!wasCommandPreempted) [self controlDidReachTargetPosition];
    };
    [[[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisTilt] incrementTargetPosition:360
                                                                                  completionBlock:completionBlock
                                                                              waitUntilStationary:NO];
}


-(IBAction)tiltAnticlockwise:(id)sender{
    void (^completionBlock) (BOOL) = ^(BOOL wasCommandPreempted)
    {
        if (!wasCommandPreempted) [self controlDidReachTargetPosition];
    };
    [[[GCGalileo sharedGalileo] positionControlForAxis:GCControlAxisTilt] incrementTargetPosition:-360
                                                                                  completionBlock:completionBlock
                                                                              waitUntilStationary:NO];
}

- (void) controlDidReachTargetPosition
{
    // Re-enable the UI now that the target has been reached, assuming we are still connected to Galileo
    if ([[GCGalileo sharedGalileo] isConnected]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
