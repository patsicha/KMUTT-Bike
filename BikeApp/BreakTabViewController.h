//
//  BreakTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BreakDelegate;
@interface BreakTabViewController : UITabBarController
@property (assign, nonatomic) id <BreakDelegate>delegate;
@end
@protocol BreakDelegate<NSObject>
@optional
- (void)test;
@end