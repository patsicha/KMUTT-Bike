//
//  ChainViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/14/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "ChainViewController.h"
#import "GearTabViewController.h"

@interface ChainViewController ()
{
    IBOutlet UILabel *lblMain;
    IBOutlet UILabel *lblMain_th;
    IBOutlet UILabel *lblTitile;
    UIImageView *img0;
    UITextView *info;
    UIButton *button;
}
@end

@implementation ChainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString *txtFilePath = [[NSBundle mainBundle] pathForResource: @"chain" ofType: @"txt"];
    NSString *txtFileContents = [NSString stringWithContentsOfFile:txtFilePath encoding:NSUTF8StringEncoding error:nil];
    
    info = [[UITextView alloc] initWithFrame:CGRectMake(37, 234, 240, 82)];
    info.text = txtFileContents;
    
    [self.scrollView addSubview:info];
    CGRect frame = info.frame;
    frame.size.height = info.contentSize.height;
    info.frame = frame;
    [info setBounces:NO];
    [info setEditable:NO];
    [info setScrollEnabled:NO];
    [info sizeToFit];
    
    
    img0 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"chain"] resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake( 150, 150) interpolationQuality:kCGInterpolationHigh]];
    
    
    [self.scrollView addSubview:img0];
    
    img0.center = CGPointMake(160, info.frame.origin.y + info.frame.size.height + img0.frame.size.height/2 +20);
    
    NSLog(@"%f",img0.frame.origin.y + img0.frame.size.height);
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchDown];
    //[button setTitle:@"Sho" forState:UIControlStateNormal];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *Durability = [[NSMutableDictionary alloc] initWithDictionary:[prefs objectForKey:@"Durability"]];
    UIImage *btnMaintainImg;
    if([[Durability objectForKey:@"gear"] isEqualToString:@"br"])
    {
        btnMaintainImg = [UIImage imageNamed:@"maintain_normal"];
        [button setUserInteractionEnabled:YES];
    }else
    {
        btnMaintainImg = [UIImage imageNamed:@"maintain_disable"];
        [button setUserInteractionEnabled:NO];
    }
    button.frame = CGRectMake(160-(125/2), img0.frame.origin.y + img0.frame.size.height + 60, 125, 26);
    [button setBackgroundImage:btnMaintainImg forState:UIControlStateNormal];
    [self.scrollView addSubview:button];
    info.font = thaisans(16);
    
    lblMain.font = thaisansb(20);
    lblMain_th.font = thaisans(18);
    lblTitile.font = thaisansb(17);
    
    info.alpha = 0;
    lblTitile.alpha = 0;
    img0.alpha = 0;
    
    
    
}
- (void)aMethod:(UIButton*)button
{
    NSLog(@"Button  clicked.");
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *strDurability = [prefs objectForKey:@"DurabilityValue"];
    float durability = [strDurability floatValue];
    durability = durability + 5;
    strDurability = [[NSString alloc] initWithFormat:@"%.0f",durability];
    [prefs setObject:strDurability forKey:@"DurabilityValue"];
    NSMutableDictionary *Durability = [[NSMutableDictionary alloc] initWithDictionary:[prefs objectForKey:@"Durability"]];
    if([[Durability objectForKey:@"gear"] isEqualToString:@"br"]) [Durability setValue:@"ni" forKey:@"gear"];
    NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:Durability];
    [prefs setObject:dict forKey:@"Durability"];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidAppear:(BOOL)animated
{
    
    self.scrollView.contentSize = CGSizeMake(320, button.frame.origin.y + 40);
    info.alpha = 0;
    lblTitile.alpha = 0;
    img0.alpha = 0;
    [UIView  beginAnimations: @""context: nil];
    [UIView setAnimationDuration:1];
    info.alpha = 1;
    lblTitile.alpha = 1;
    img0.alpha = 1;
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
