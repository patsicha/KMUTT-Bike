//
//  PedalTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PedalDelegate;
@interface PedalTabViewController : UITabBarController
@property (assign, nonatomic) id <PedalDelegate>delegate;
@end
@protocol PedalDelegate<NSObject>
@optional
- (void)test;
@end