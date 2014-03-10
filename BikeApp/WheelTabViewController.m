//
//  WheelTabViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/10/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "WheelTabViewController.h"

@interface WheelTabViewController ()

@end

@implementation WheelTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // set selected and unselected icons
    UITabBarItem *item = [self.tabBar.items objectAtIndex:0];
    item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item.image = [[UIImage imageNamed:@"hub_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    item.selectedImage = [[UIImage imageNamed:@"hub_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:1];
    item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item2.image = [[UIImage imageNamed:@"tire_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    item2.selectedImage = [[UIImage imageNamed:@"tire_icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIColor * color = [UIColor colorWithRed:29/255.0f green:30/255.0f blue:32/255.0f alpha:1.0f];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:color];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
