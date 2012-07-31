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
@synthesize device = _device;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    BOOL startUp = [[NSUserDefaults standardUserDefaults] boolForKey:@"startUp"];
    if(startUp)
        [self toggleLED:nil];
    
    
//    NSDictionary *textTitleOptions = [NSDictionary dictionaryWithObjectsAndKeys:
//                                      [UIFont fontWithName:@"DryGoodsAntiqueJL" size:25], UITextAttributeFont,
//                                      [UIColor whiteColor], UITextAttributeTextColor,
//                                      [UIColor whiteColor], UITextAttributeTextShadowColor
//                                      , nil];
//
//    UINavigationBar *bar = (UINavigationBar *)[self.view viewWithTag:5];
//    bar.titleTextAttributes = textTitleOptions;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    BOOL startUp = [[NSUserDefaults standardUserDefaults] boolForKey:@"startUp"];
    if(startUp)
        [self toggleLED:nil];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if(self.device.torchMode == AVCaptureTorchModeOn)
        [self toggleLED:nil];
}

- (void)viewDidUnload
{
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

        if(self.device.torchMode == AVCaptureTorchModeOn)
            [self.device setTorchMode:AVCaptureTorchModeOff];
        else 
            [self.device setTorchMode:AVCaptureTorchModeOn];
        
        [self.device unlockForConfiguration];

    }
    
}
@end
