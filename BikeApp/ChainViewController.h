//
//  ChainViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChainDelegate;
@interface ChainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
