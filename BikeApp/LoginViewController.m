//
//  LoginViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "LoginViewController.h"

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

@end
