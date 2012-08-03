//
//  SecondViewController.h
//  MorseCode
//
//  Created by Ali Taher on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>



@interface SecondViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *messageToSend;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)sendMorseCode:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *messageSending;
@property (weak, nonatomic) IBOutlet UIProgressView *sendingProgress;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
