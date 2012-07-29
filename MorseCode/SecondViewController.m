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
@property(strong, nonatomic) NSMutableDictionary *morseCode;
@property(strong, nonatomic) NSTimer *message;
@property( nonatomic) NSInteger messageSize;
-(void)next:(NSTimer *)timer;
-(void)toggleTorch;
-(void)sendMessage;

@end

@implementation SecondViewController
@synthesize sendingProgress = _sendingProgress;
@synthesize messageSending = _messageSending, message = _message, messageSize= _messageSize;



@synthesize messageToSend = _messageToSend;
@synthesize device = _device, morseCode = _morseCode;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
//    //setup morseCode  might try loading from a plist later
//    self.morseCode = [[NSMutableDictionary alloc] init ];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash", nil] forKey:@"A"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dot",@"dot", nil] forKey:@"B"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dash",@"dot", nil] forKey:@"C"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dot", nil] forKey:@"D"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot", nil] forKey:@"E"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dash",@"dot", nil] forKey:@"F"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dot", nil] forKey:@"G"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot",@"dot", nil] forKey:@"H"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot", nil] forKey:@"I"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dash",@"dash", nil] forKey:@"J"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dash", nil] forKey:@"K"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dot",@"dot", nil] forKey:@"L"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash", nil] forKey:@"M"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot", nil] forKey:@"N"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dash", nil] forKey:@"O"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dash",@"dot", nil] forKey:@"P"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dot",@"dash", nil] forKey:@"Q"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dot", nil] forKey:@"R"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot", nil] forKey:@"S"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash", nil] forKey:@"T"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dash", nil] forKey:@"U"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot",@"dash", nil] forKey:@"V"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dash", nil] forKey:@"W"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dot",@"dash", nil] forKey:@"X"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dash",@"dash", nil] forKey:@"Y"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dot",@"dot", nil] forKey:@"Z"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dash",@"dash",@"dash",@"dash", nil] forKey:@"1"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dash",@"dash",@"dash", nil] forKey:@"2"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot",@"dash",@"dash", nil] forKey:@"3"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot",@"dot",@"dash", nil] forKey:@"4"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dot",@"dot",@"dot",@"dot",@"dot", nil] forKey:@"5"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dot",@"dot",@"dot",@"dot", nil] forKey:@"6"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dot",@"dot", @"dot",nil] forKey:@"7"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dash", @"dot",@"dot",nil] forKey:@"8"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dash",@"dash",@"dot", nil] forKey:@"9"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"dash",@"dash",@"dash",@"dash",@"dash", nil] forKey:@"0"];
//    [self.morseCode setValue:[[NSArray alloc] initWithObjects:@"space", nil] forKey:@" "];
    
    NSString *location = [[NSBundle mainBundle] pathForResource:@"morseCodes" ofType:@"plist"];
    self.morseCode = [[NSMutableDictionary alloc] initWithContentsOfFile:location];
    
    
    
    
}

- (void)viewDidUnload
{
    [self setMessageToSend:nil];
    [self setMessageSending:nil];
    [self setSendingProgress:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)sendMessage{
    NSString *character;
    NSArray *charCode;
    NSString *messageToConvert = self.messageToSend.text;
    
    NSLog(@"%@",messageToConvert);
    NSMutableArray *codedMessage = [[NSMutableArray alloc] init];
    
    for(NSInteger x = 0; x < messageToConvert.length ;x++){
        character = [messageToConvert substringWithRange:NSMakeRange(x,1)] ;
        charCode = [self.morseCode valueForKey:character];
        
        if (charCode != nil) {
            for(NSInteger y = 0; y < [charCode count]; y++){
                [codedMessage addObject:[charCode objectAtIndex:y]];
                if(y != ([charCode count]-1))
                    [codedMessage addObject:@"dotOff"];
            }
            [codedMessage addObject:@"dashOff"];
        }
    }
    
    //for debugging
    for(NSInteger i=0; i < [codedMessage count]; i++)
        NSLog(@"%@",[codedMessage objectAtIndex:i]);
    
    if(![self.message isValid]){
        self.messageSize = [codedMessage count];
        self.messageSending.hidden = NO;
        [self.sendingProgress setProgress:0.00];
        self.sendingProgress.hidden = NO;
        self.message = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(next:) userInfo:codedMessage repeats:NO];
    }
}


-(void)next:(NSTimer *)timer{
    
    double speed = 0.35;
    
    if(self.device.torchMode == AVCaptureTorchModeOn)
        [self toggleTorch];
    
    if ([timer.userInfo count] != 0) {
        self.sendingProgress.progress += (1.00/self.messageSize);
        
        if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dot"]) {
            [self toggleTorch];
            self.message=[NSTimer scheduledTimerWithTimeInterval:1*speed target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dash"]) {
            [self toggleTorch];
            self.message=[NSTimer scheduledTimerWithTimeInterval:3*speed target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dashOff"]) {
            
            self.message=[NSTimer scheduledTimerWithTimeInterval:3*speed target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else if ([[timer.userInfo objectAtIndex:0] isEqualToString: @"dotOff"]) {
            
            self.message=[NSTimer scheduledTimerWithTimeInterval:1*speed target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        else{    
            self.message=[NSTimer scheduledTimerWithTimeInterval:2*speed target:self selector:@selector(next:) userInfo:timer.userInfo repeats:NO];
        }
        
    }
    else {
        self.messageSending.hidden = YES;
        self.sendingProgress.hidden = YES;
    }
    
    if([timer.userInfo count] > 0)
        [timer.userInfo removeObjectAtIndex:0]; 
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

- (IBAction)stopMorseCode:(id)sender {
    if([self.message isValid]){
        self.messageSending.hidden = YES;
        self.sendingProgress.hidden = YES;
        if(self.device.torchMode == AVCaptureTorchModeOn)
            [self toggleTorch];
        [self.message invalidate];
    }

}
@end
