//
//  SaddleTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SaddleDelegate;
@interface SaddleTabViewController : UITabBarController
@property (assign, nonatomic) id <SaddleDelegate>delegate;
@end
@protocol SaddleDelegate<NSObject>
@optional
- (void)test;
@end