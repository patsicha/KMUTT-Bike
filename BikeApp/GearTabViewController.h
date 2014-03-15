//
//  GearTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GearDelegate;

@interface GearTabViewController : UITabBarController
@property (assign, nonatomic) id <GearDelegate>delegate;
@end
@protocol GearDelegate<NSObject>
@optional
- (void)test;
@end
