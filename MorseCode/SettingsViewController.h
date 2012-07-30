//
//  SettingsViewController.h
//  MorseCode
//
//  Created by Ali Taher on 7/29/12.
//
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UITableViewController 
- (IBAction)updateSettings:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *startupLight;

@end
