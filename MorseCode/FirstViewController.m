//
//  FirstViewController.m
//  MorseCode
//
//  Created by Ali Taher on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()
@property(weak, nonatomic) AVCaptureDevice *device; 
@end

@implementation FirstViewController
@synthesize lightSwitch = _lightSwitch;
@synthesize switchLabel = _switchLabel;
@synthesize device = _device;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];


    
    self.switchLabel.font = [UIFont fontWithName:@"DryGoodsAntiqueJL" size:35];

}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    BOOL startUp = [[NSUserDefaults standardUserDefaults] boolForKey:@"startUp"];
    if(startUp){
        [self toggleLED:nil];
        [self.lightSwitch setOn:YES animated:YES];
    }
    else
        [self.lightSwitch setOn:NO animated:YES];

}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if(self.device.torchMode == AVCaptureTorchModeOn)
        [self toggleLED:nil];
}

- (void)viewDidUnload
{
    [self setLightSwitch:nil];
    [self setSwitchLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)toggleLED:(id)sender {
    
    if([self.device hasTorch]){
        [self.device lockForConfiguration:nil];  

        if(self.device.torchMode == AVCaptureTorchModeOn){
            [self.device setTorchMode:AVCaptureTorchModeOff];
            [self.lightSwitch setOn:NO animated:YES];
        }
        else {
            [self.device setTorchMode:AVCaptureTorchModeOn];
            [self.lightSwitch setOn:YES animated:YES];
        }
        
        [self.device unlockForConfiguration];

    }
    
}
@end
