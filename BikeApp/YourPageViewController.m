//
//  YourPageViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "YourPageViewController.h"
#import "NotifyViewController.h"

@interface YourPageViewController ()
{
    float durability;
    IBOutlet UILabel *txtNo;
    IBOutlet UILabel *txtName;
    IBOutlet UILabel *txtLastname;
    IBOutlet UILabel *txtBikeNo;
    IBOutlet UILabel *txtDurability;
    IBOutlet UIBarButtonItem *urgent;
}
@end

@implementation YourPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"profile"]];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"status"]];
	[self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"update"]];
    
    self.imageView.image = [self.imageView.image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(100, 100) interpolationQuality:kCGInterpolationHigh];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height /2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeTop;
    self.imageView.clipsToBounds = YES;
    durability = 60;
    
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
    txtBikeNo.font = segoeui(10);
    txtDurability.font = segoeuib(14);
    

    self.navigationItem.rightBarButtonItem=[self urgentButton];
    
   

}
- (UIBarButtonItem *)urgentButton
{
    UIImage *imgUrgent = [UIImage imageNamed:@"urgentcall.png"];
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
