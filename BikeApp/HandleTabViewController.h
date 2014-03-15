//
//  HandleTabViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HandleDelegate;
@interface HandleTabViewController : UITabBarController
@property (assign, nonatomic) id <HandleDelegate>delegate;
@end
@protocol HandleDelegate<NSObject>
@optional
- (void)test;
@end