//
//  StatusViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "StatusViewController.h"
#import "WheelTabViewController.h"
#import "BreakTabViewController.h"
#import "GearTabViewController.h"
#import "PedalTabViewController.h"
#import "SaddleTabViewController.h"
#import "HandleTabViewController.h"

@interface StatusViewController ()
{
    NSString *lastSelected;
    
    UIImage *img_gear;
    UIImage *img_gear_click;
    
    UIImage *img_wheel;
    UIImage *img_wheel_click;
    
    UIImage *img_break;
    UIImage *img_break_click;
    
    UIImage *img_saddle;
    UIImage *img_saddle_click;
    
    UIImage *img_pedal;
    UIImage *img_pedal_click;
    
    UIImage *img_handle;
    UIImage *img_handle_click;

}
@end

@implementation StatusViewController

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
    
    lblTxt.font = segoeui(14);
    
}
-(void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary *Durability = [prefs objectForKey:@"Durability"];
    NSLog(@"%@",Durability);
    if([[Durability objectForKey:@"gear"] isEqualToString:@"br"])
    {
        img_gear = [UIImage imageNamed:@"gear_fix.png"];
        img_gear_click = [UIImage imageNamed:@"gear_click2.png"];
    }else{
        img_gear = [UIImage imageNamed:@"gear_good.png"];
        img_gear_click = [UIImage imageNamed:@"gear_click.png"];
    }
    
    if([[Durability objectForKey:@"wheel"] isEqualToString:@"br"])
    {
        img_wheel = [UIImage imageNamed:@"wheel_fix.png"];
        img_wheel_click = [UIImage imageNamed:@"wheel_click2.png"];
    }else{
        img_wheel = [UIImage imageNamed:@"wheel_good.png"];
        img_wheel_click = [UIImage imageNamed:@"wheel_click.png"];
    }
    
    if([[Durability objectForKey:@"break"] isEqualToString:@"br"])
    {
        img_break = [UIImage imageNamed:@"break_fix.png"];
        img_break_click = [UIImage imageNamed:@"break_click2.png"];
    }else{
        img_break = [UIImage imageNamed:@"break_good.png"];
        img_break_click = [UIImage imageNamed:@"break_click.png"];
    }
    
    if([[Durability objectForKey:@"saddle"] isEqualToString:@"br"])
    {
        img_saddle = [UIImage imageNamed:@"saddle_fix.png"];
        img_saddle_click = [UIImage imageNamed:@"saddle_click2.png"];
    }else{
        img_saddle = [UIImage imageNamed:@"saddle_good.png"];
        img_saddle_click = [UIImage imageNamed:@"saddle_click.png"];
    }
    
    if([[Durability objectForKey:@"pedal"] isEqualToString:@"br"])
    {
        img_pedal = [UIImage imageNamed:@"pedal_fix.png"];
        img_pedal_click = [UIImage imageNamed:@"pedal_click2.png"];
    }else{
        img_pedal = [UIImage imageNamed:@"pedal_good.png"];
        img_pedal_click = [UIImage imageNamed:@"pedal_click.png"];
    }
    
    if([[Durability objectForKey:@"handle"] isEqualToString:@"br"])
    {
        img_handle = [UIImage imageNamed:@"handle_fix.png"];
        img_handle_click = [UIImage imageNamed:@"handle_click2.png"];
    }else{
        img_handle = [UIImage imageNamed:@"handle_good.png"];
        img_handle_click = [UIImage imageNamed:@"handle_click.png"];
    }
    
    
    
    
    [btnGear setBackgroundImage:img_gear forState:UIControlStateNormal];
    [btnWheel setBackgroundImage:img_wheel forState:UIControlStateNormal];
    [btnBreak setBackgroundImage:img_break forState:UIControlStateNormal];
    [btnSaddle setBackgroundImage:img_saddle forState:UIControlStateNormal];
    [btnPedal setBackgroundImage:img_pedal forState:UIControlStateNormal];
    [btnHandle setBackgroundImage:img_handle forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selected:(id)sender {
    
    lblTxt.text = @"";
    [btnGear setBackgroundImage:img_gear forState:UIControlStateNormal];
    [btnWheel setBackgroundImage:img_wheel forState:UIControlStateNormal];
    [btnBreak setBackgroundImage:img_break forState:UIControlStateNormal];
    [btnSaddle setBackgroundImage:img_saddle forState:UIControlStateNormal];
    [btnPedal setBackgroundImage:img_pedal forState:UIControlStateNormal];
    [btnHandle setBackgroundImage:img_handle forState:UIControlStateNormal];
    
    if(sender == btnGear)
    {
        [btnGear setBackgroundImage:img_gear_click forState:UIControlStateNormal];
        lblTxt.text = @"Gear";
    }
    
    if(sender == btnWheel)
    {
        [btnWheel setBackgroundImage:img_wheel_click forState:UIControlStateNormal];
        lblTxt.text = @"Wheel";
    }
    
    if(sender == btnBreak)
    {
        [btnBreak setBackgroundImage:img_break_click forState:UIControlStateNormal];
        lblTxt.text = @"Break";
    }
    
    if(sender == btnSaddle)
    {
        [btnSaddle setBackgroundImage:img_saddle_click forState:UIControlStateNormal];
        lblTxt.text = @"Saddle";
    }
    
    if(sender == btnPedal)
    {
        [btnPedal setBackgroundImage:img_pedal_click forState:UIControlStateNormal];
        lblTxt.text = @"Pedal";
    }
    
    if(sender == btnHandle)
    {
        [btnHandle setBackgroundImage:img_handle_click forState:UIControlStateNormal];
        lblTxt.text = @"Handle";
    }
    
    if([lastSelected isEqualToString:lblTxt.text] )
    {
        [btnGear setBackgroundImage:img_gear forState:UIControlStateNormal];
        [btnWheel setBackgroundImage:img_wheel forState:UIControlStateNormal];
        [btnBreak setBackgroundImage:img_break forState:UIControlStateNormal];
        [btnSaddle setBackgroundImage:img_saddle forState:UIControlStateNormal];
        [btnPedal setBackgroundImage:img_pedal forState:UIControlStateNormal];
        [btnHandle setBackgroundImage:img_handle forState:UIControlStateNormal];
        lblTxt.text = @"";
        
        if([lastSelected isEqualToString:@"Gear"])
        {
            GearTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Gear"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
        
        if([lastSelected isEqualToString:@"Wheel"])
        {
            WheelTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Wheel"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
        if([lastSelected isEqualToString:@"Break"])
        {
            BreakTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Break"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
        if([lastSelected isEqualToString:@"Pedal"])
        {
            PedalTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Pedal"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
        if([lastSelected isEqualToString:@"Saddle"])
        {
            SaddleTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Saddle"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
        if([lastSelected isEqualToString:@"Handle"])
        {
            HandleTabViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Handle"];
            svc.delegate = self;
            [self presentViewController:svc animated:YES completion:nil];
        }
    }
    
    lastSelected = lblTxt.text;
}

- (void)test
{
    NSLog(@"delegate");
    NSLog(@"Button  clicked.");
    
    [self viewDidAppear:YES];
    [[self parentViewController] viewDidLoad];
}

@end
