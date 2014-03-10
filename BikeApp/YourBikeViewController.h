//
//  YourBikeViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YourBikeViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIView *contentView;
    IBOutlet UIView *contentView2;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *contentPageControl;
    IBOutlet UIProgressView *tabDurability;
}
@end
