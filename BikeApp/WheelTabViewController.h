//
//  WheelTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/10/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WheelDelegate;
@interface WheelTabViewController : UITabBarController
@property (assign, nonatomic) id <WheelDelegate>delegate;
@end
@protocol WheelDelegate<NSObject>
@optional
- (void)test;
@end