//
//  SecondViewController.m
//  MorseCode
//
//  Created by Ali Taher on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()
@property(weak, nonatomic) AVCaptureDevice *device; 

-(void)next:(NSTimer *)timer;
-(void)dot;
-(void)toggleTorch;
-(void)sendMessage;

@end

@implementation SecondViewController
{
    
}


@synthesize messageToSend = _messageToSend;
@synthesize device = _device ;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
}

- (void)viewDidUnload
{
    [self setMessageToSend:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(void)sendMessage{
    NSMutableArray *times = [[NSMutableArray alloc] initWithObjects:@"dot",@"nextLetter",@"dash",@"dot",@"dash", nil];
    [self toggleTorch];
    
    
    
    
    
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(next:) userInfo:times repeats:NO];
    
}


-(void)next:(NSTimer *)timer{
    
    if(self.device.torchMode == AVCaptureTorchModeOn)
        [self toggleTorch];
    [timer.userInfo removeObjectAtIndex:0];
    if ([timer.userInfo count] != 0) {
        
        
        if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dot"]) {
            [self toggleTorch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dash"]) {
            [self toggleTorch];
            [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dashOff"]) {
            
            [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dotOff"]) {
            
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else{    
            [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
    
    }
}

-(void)dot{
    [self toggleTorch];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(toggleTorch) userInfo:nil repeats:NO];
    
    
    
}



-(void)toggleTorch{
    
    if([self.device hasTorch]){
        [self.device lockForConfiguration:nil];  
        
        if(self.device.torchMode == AVCaptureTorchModeOn){
            [self.device setTorchMode:AVCaptureTorchModeOff];
        }else{ 
            [self.device setTorchMode:AVCaptureTorchModeOn];
        }
        [self.device unlockForConfiguration];
        
    }
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.messageToSend resignFirstResponder];
    return YES;
    
}


- (IBAction)dismissKeyboard:(id)sender {
    [self.messageToSend resignFirstResponder];
    
}

- (IBAction)sendMorseCode:(id)sender {
    
    [self sendMessage];
}
@end
