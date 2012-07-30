//
//  SettingsViewController.m
//  MorseCode
//
//  Created by Ali Taher on 7/29/12.
//
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize startupLight;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.startupLight.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"startUp"];

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setStartupLight:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)updateSettings:(id)sender {
    
    BOOL startUp = self.startupLight.on;
    [[NSUserDefaults standardUserDefaults] setBool:startUp forKey:@"startUp"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancel:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
