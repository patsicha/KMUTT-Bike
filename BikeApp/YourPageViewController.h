//
//  YourPageViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "PagerViewController.h"

@interface YourPageViewController : PagerViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSString *bikeCode;
@end
