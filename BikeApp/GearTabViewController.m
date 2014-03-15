//
//  GearTabViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "GearTabViewController.h"

@interface GearTabViewController ()

@end

@implementation GearTabViewController

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
    UIImage* tabBarBackground = [UIImage imageNamed:@"a_00"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"a_01_01"]];
    
    UITabBarItem *item = [self.tabBar.items objectAtIndex:1];
    item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item.image = [[UIImage imageNamed:@"crank_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = [[UIImage imageNamed:@"crank_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:0];
    item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    item2.image = [[UIImage imageNamed:@"chain_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.selectedImage = [[UIImage imageNamed:@"chain_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIColor * color = [UIColor colorWithRed:29/255.0f green:30/255.0f blue:32/255.0f alpha:1.0f];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:color];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(test)]) {
        [self.delegate test];
    }
}



@end
