//
//  LoginViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"

@interface LoginViewController ()
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)fontall
{
    for(NSString* family in [UIFont familyNames]) {
        NSLog(@"%@", family);
        for(NSString* name in [UIFont fontNamesForFamilyName: family]) {
            NSLog(@"  %@", name);
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUI];
    //[self fontall];
    
    NSString *model = [[UIDevice currentDevice] model];
    if ([model isEqualToString:@"iPhone Simulator"]) {
        txtUsername.text = @"53211536";
        txtPassword.text = @"1234";
    }
    
}
- (IBAction)login:(id)sender {
    
    if([txtUsername.text isEqualToString:@"53211536"] && [txtPassword.text isEqualToString:@"1234"])
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:txtUsername.text  forKey:@"MemberInfo"];
        
        txtUsername.text = @"";
        txtPassword.text = @"";
        
        [EEHUDView growlWithMessage:@"welcome"
                          showStyle:EEHUDViewShowStyleFadeIn
                          hideStyle:EEHUDViewHideStyleFadeOut
                    resultViewStyle:EEHUDResultViewStyleChecked
                           showTime:1.0];

        FirstViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
        [svc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:svc animated:YES completion:nil];
    }
    else{
        [EEHUDView growlWithMessage:@"miss something?"
                          showStyle:EEHUDViewShowStyleShake
                          hideStyle:EEHUDViewHideStyleFadeOut
                    resultViewStyle:EEHUDResultViewStyleNG
                           showTime:0.75];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtUsername.leftView = paddingView;
    txtUsername.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtPassword.leftView = paddingView;
    txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
    [btnFacebook setBackgroundImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [btnFacebook setBackgroundImage:[UIImage imageNamed:@"facebook_click.png"] forState:UIControlStateHighlighted];
    [btnTwitter setBackgroundImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    [btnTwitter setBackgroundImage:[UIImage imageNamed:@"twitter_click.png"] forState:UIControlStateHighlighted];
    
}
- (IBAction)facebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/KMUTTVolunteer"]];
}
- (IBAction)twitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/kmuttbike"]];
}


@end
