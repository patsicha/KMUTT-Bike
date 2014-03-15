//
//  PagerViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PagerViewController : UIViewController <UIScrollViewDelegate>
{
    IBOutlet UIView *contentView;
    IBOutlet UIView *contentView2;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *contentPageControl;
    IBOutlet UIImageView *bg;
}

- (IBAction)changePage:(id)sender;

- (void)previousPage;
- (void)nextPage;

@end
