//
//  FirstViewController.h
//  MorseCode
//
//  Created by Ali Taher on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface FirstViewController : UIViewController
- (IBAction)toggleLED:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *lightSwitch;
@property (weak, nonatomic) IBOutlet UILabel *switchLabel;

@end
