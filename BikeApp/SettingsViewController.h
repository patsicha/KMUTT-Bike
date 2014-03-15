//
//  SettingsViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/13/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MJSecondPopupDelegate;

@interface SettingsViewController : UIViewController <UIAlertViewDelegate>
@property (assign, nonatomic) id <MJSecondPopupDelegate>delegate;

@end

@protocol MJSecondPopupDelegate<NSObject>
@optional
- (void)cancelButtonClicked:(SettingsViewController*)secondDetailViewController;
- (void)okButtonClicked:(SettingsViewController*)secondDetailViewController;
- (void)changeLanguege:(BOOL)Thai;
@end
