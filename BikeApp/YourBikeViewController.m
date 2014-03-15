//
//  YourBikeViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "YourBikeViewController.h"

@interface YourBikeViewController ()
{
    NSInteger indexContentView;
    float durability;
}

@end

@implementation YourBikeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    durability = 60;
    
	// Do any additional setup after loading the view.
    UIColor *topColor = [UIColor colorWithRed:255/255.0f green:195/255.0f blue:64/255.0f alpha:1.0f];
     [self.navigationController.navigationBar setBarTintColor:topColor];
    
    UIColor *bottomBolor = [UIColor colorWithRed:29/255.0f green:30/255.0f blue:32/255.0f alpha:1.0f];
    //[contentView setBackgroundColor:bottomBolor];
    
    indexContentView = 1;
    [self updateContentView];
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, 3.0f);
    tabDurability.transform = transform;
    tabDurability.progress = durability/100;
    //tabDurability border
    
    // Adjust scroll view content size, set background colour and turn on paging
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 2,
                                        scrollView.frame.size.height);
    scrollView.pagingEnabled=YES;
    [contentView setTag:0];
    [scrollView addSubview:contentView];
    [contentView2 setFrame:CGRectMake(((scrollView.frame.size.width)*1), 0,
                                      (contentView2.frame.size.width), contentView2.frame.size.height)];
    [contentView setTag:1];
    [scrollView addSubview:contentView2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logout:(id)sender {
    [self.parentViewController dismissViewControllerAnimated:YES completion:Nil];
}

- (void)updateContentView
{
    contentPageControl.currentPage = indexContentView;
}



@end
