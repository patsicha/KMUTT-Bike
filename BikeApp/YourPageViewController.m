//
//  YourPageViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "YourPageViewController.h"
#import "NotifyViewController.h"
#import "SettingsViewController.h"

@interface YourPageViewController ()
{
    float durability;
    IBOutlet UILabel *txtNo;
    IBOutlet UILabel *txtName;
    IBOutlet UILabel *txtLastname;
    IBOutlet UILabel *txtBikeNoTitle;
    IBOutlet UILabel *txtBikeNo;
    IBOutlet UILabel *txtDurabilityTitle;
    IBOutlet UILabel *txtDurability;
    IBOutlet UIBarButtonItem *urgent;
}
@end

@implementation YourPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary *Durability = [prefs objectForKey:@"Durability"];
    NSMutableArray *userInfo = [[NSMutableArray alloc] init];
    userInfo = [prefs objectForKey:@"MemberInfo"];
    
    if(Durability == nil)
    {
        NSDictionary *dict;
        dict = [NSDictionary dictionaryWithObjectsAndKeys:
                @"G", @"gear",
                @"G", @"wheel",
                @"G", @"break",
                @"G", @"pedal",
                @"G", @"saddle",
                @"G", @"handle",
                nil];
        Durability = dict;
        [prefs setObject:Durability forKey:@"Durability"];
    }
    //[prefs setObject:@"100" forKey:@"DurabilityValue"];
    NSString *strDurability = [prefs objectForKey:@"DurabilityValue"];
    if(strDurability == nil || [strDurability floatValue] < 1)
    {
        strDurability = @"100.00";
        durability = [strDurability floatValue];
        [prefs setObject:strDurability forKey:@"DurabilityValue"];
    }else{
        durability = [strDurability floatValue];
        
    }

    [self.navigationItem setHidesBackButton:YES];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"profile"]];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"status"]];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"update"]];
    
    txtNo.text = [userInfo valueForKey:@"student_id"]; // student_id
    txtName.text = [userInfo valueForKey:@"student_name_en"]; // student_name_en
    txtLastname.text = [userInfo valueForKey:@"student_surname_en"]; // student_surname_en
    txtBikeNo.text = _bikeCode;
    txtDurability.text = [[NSString alloc] initWithFormat:@"%.0f%%",durability];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[userInfo valueForKey:@"student_picture"]]]];
    self.imageView.image = image;
    
    self.imageView.image = [self.imageView.image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(100, 100) interpolationQuality:kCGInterpolationHigh];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height /2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeTop;
    self.imageView.clipsToBounds = YES;
    //durability = 60;
    
	// Do any additional setup after loading the view.
    UIColor *topColor = [UIColor colorWithRed:255/255.0f green:195/255.0f blue:64/255.0f alpha:1.0f];
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      segoeuib(20),
      NSFontAttributeName,[UIColor whiteColor],
      NSForegroundColorAttributeName, nil]];
    
    UIColor *bottomBolor = [UIColor colorWithRed:29/255.0f green:30/255.0f blue:32/255.0f alpha:1.0f];
    //[contentView setBackgroundColor:bottomBolor];
    
    AMProgressView *tabDurability = [[AMProgressView alloc] initWithFrame:CGRectMake(25, 164, 270, 10)
                                              andGradientColors:[NSArray arrayWithObjects:topColor, nil]
                                               andOutsideBorder:YES
                                                    andVertical:NO];
    tabDurability.outsideBorderColor = topColor;
    tabDurability.maximumValue = 100;
    tabDurability.progressAnimationDuration = 1;
    tabDurability.progress = durability;
    
    [self.view addSubview:tabDurability];
    
    
    
    txtNo.font = segoeuil(14);
    txtName.font = segoeui(20);
    txtLastname.font = segoeuii(13);
    txtBikeNoTitle.font = segoeui(10);
    txtBikeNo.font = segoeuii(9);
    txtDurabilityTitle.font = segoeuib(14);
    txtDurability.font = segoeuil(14);

    self.navigationItem.leftBarButtonItem=[self urgentButton];
    self.navigationItem.rightBarButtonItem=[self settingsButton];
   

}

- (UIBarButtonItem *)settingsButton
{
    UIImage *imgUrgent = [UIImage imageNamed:@"gear_setting_white"];
    CGRect buttonFrame = CGRectMake(0, 0, imgUrgent.size.width/2, imgUrgent.size.height/2);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(settingsPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imgUrgent forState:UIControlStateNormal];
    
    UIBarButtonItem *item= [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}
- (void)settingsPressed
{
    SettingsViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Settings"];
    svc.delegate = self;
    [self presentPopupViewController:svc animationType:MJPopupViewAnimationSlideTopTop];
}

- (void)okButtonClicked:(SettingsViewController *)aSecondDetailViewController
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:nil  forKey:@"MemberInfo"];
    [prefs setObject:nil  forKey:@"bikeCode"];
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)cancelButtonClicked:(SettingsViewController *)aSecondDetailViewController
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopTop];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}
- (UIBarButtonItem *)urgentButton
{
    UIImage *imgUrgent = [UIImage imageNamed:@"urgentcall"];
    CGRect buttonFrame = CGRectMake(0, 0, imgUrgent.size.width/2, imgUrgent.size.height/2);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(urgentButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imgUrgent forState:UIControlStateNormal];
    
    UIBarButtonItem *item= [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

-(void) urgentButtonPressed
{
    NotifyViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Notify"];
    [self.navigationController pushViewController:svc animated:YES];
}

@end
