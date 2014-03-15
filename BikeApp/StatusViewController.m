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
    UIImage *gear_good;
    UIImage *gear_click;
    UIImage *gear_click2;
    UIImage *gear_fix;
    
    UIImage *wheel_good;
    UIImage *wheel_click;
    UIImage *wheel_click2;
    UIImage *wheel_fix;
    
    UIImage *break_good;
    UIImage *break_click;
    UIImage *break_click2;
    UIImage *break_fix;
    
    UIImage *saddle_good;
    UIImage *saddle_click;
    UIImage *saddle_click2;
    UIImage *saddle_fix;
    
    UIImage *pedal_good;
    UIImage *pedal_click;
    UIImage *pedal_click2;
    UIImage *pedal_fix;
    
    UIImage *handle_good;
    UIImage *handle_click;
    UIImage *handle_click2;
    UIImage *handle_fix;
    
    //NSDictionary *Durability;
    
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
    
    
    
    
    
    saddle_good = [UIImage imageNamed:@"saddle_good.png"];
    saddle_click = [UIImage imageNamed:@"saddle_click.png"];
    saddle_click2 = [UIImage imageNamed:@"saddle_click2.png"];
    saddle_fix = [UIImage imageNamed:@"saddle_fix.png"];
    
    pedal_good = [UIImage imageNamed:@"pedal_good.png"];
    pedal_click = [UIImage imageNamed:@"pedal_click.png"];
    pedal_click2 = [UIImage imageNamed:@"pedal_click2.png"];
    pedal_fix = [UIImage imageNamed:@"pedal_fix.png"];
    
    handle_good = [UIImage imageNamed:@"handle_good.png"];
    handle_click = [UIImage imageNamed:@"handle_click.png"];
    handle_click2 = [UIImage imageNamed:@"handle_click2.png"];
    handle_fix = [UIImage imageNamed:@"handle_fix.png"];
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSDictionary *Durability = [prefs objectForKey:@"Durability"];
    NSLog(@"%@",Durability);
    if([[Durability objectForKey:@"gear"] isEqualToString:@"B"])
    {
        gear_click = [UIImage imageNamed:@"gear_click2.png"];
        gear_good = [UIImage imageNamed:@"gear_fix.png"];
    }else{
        gear_good = [UIImage imageNamed:@"gear_good.png"];
        gear_click = [UIImage imageNamed:@"gear_click.png"];
    }
    if([[Durability objectForKey:@"wheel"] isEqualToString:@"B"])
    {
        wheel_click = [UIImage imageNamed:@"wheel_click2.png"];
        wheel_good = [UIImage imageNamed:@"wheel_fix.png"];
    }else{
        wheel_good = [UIImage imageNamed:@"wheel_good.png"];
        wheel_click = [UIImage imageNamed:@"wheel_click.png"];
    }
    
    if([[Durability objectForKey:@"break"] isEqualToString:@"B"])
    {
        break_good = [UIImage imageNamed:@"break_fix.png"];
        break_click = [UIImage imageNamed:@"break_click2.png"];
    }else{
        break_good = [UIImage imageNamed:@"break_good.png"];
        break_click = [UIImage imageNamed:@"break_click.png"];
    }
    
    
    
    
    [btnGear setBackgroundImage:gear_good forState:UIControlStateNormal];
    [btnWheel setBackgroundImage:wheel_good forState:UIControlStateNormal];
    [btnBreak setBackgroundImage:break_good forState:UIControlStateNormal];
    [btnSaddle setBackgroundImage:saddle_good forState:UIControlStateNormal];
    [btnPedal setBackgroundImage:pedal_good forState:UIControlStateNormal];
    [btnHandle setBackgroundImage:handle_good forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selected:(id)sender {
    
    lblTxt.text = @"";
    [btnGear setBackgroundImage:gear_good forState:UIControlStateNormal];
    [btnWheel setBackgroundImage:wheel_good forState:UIControlStateNormal];
    [btnBreak setBackgroundImage:break_good forState:UIControlStateNormal];
    [btnSaddle setBackgroundImage:saddle_good forState:UIControlStateNormal];
    [btnPedal setBackgroundImage:pedal_good forState:UIControlStateNormal];
    [btnHandle setBackgroundImage:handle_good forState:UIControlStateNormal];
    
    if(sender == btnGear)
    {
        [btnGear setBackgroundImage:gear_click forState:UIControlStateNormal];
        lblTxt.text = @"Gear";
    }
    
    if(sender == btnWheel)
    {
        [btnWheel setBackgroundImage:wheel_click forState:UIControlStateNormal];
        lblTxt.text = @"Wheel";
    }
    
    if(sender == btnBreak)
    {
        [btnBreak setBackgroundImage:break_click forState:UIControlStateNormal];
        lblTxt.text = @"Break";
    }
    
    if(sender == btnSaddle)
    {
        [btnSaddle setBackgroundImage:saddle_click forState:UIControlStateNormal];
        lblTxt.text = @"Saddle";
    }
    
    if(sender == btnPedal)
    {
        [btnPedal setBackgroundImage:pedal_click forState:UIControlStateNormal];
        lblTxt.text = @"Pedal";
    }
    
    if(sender == btnHandle)
    {
        [btnHandle setBackgroundImage:handle_click forState:UIControlStateNormal];
        lblTxt.text = @"Handle";
    }
    
    if([lastSelected isEqualToString:lblTxt.text] )
    {
        [btnGear setBackgroundImage:gear_good forState:UIControlStateNormal];
        [btnWheel setBackgroundImage:wheel_good forState:UIControlStateNormal];
        [btnBreak setBackgroundImage:break_good forState:UIControlStateNormal];
        [btnSaddle setBackgroundImage:saddle_good forState:UIControlStateNormal];
        [btnPedal setBackgroundImage:pedal_good forState:UIControlStateNormal];
        [btnHandle setBackgroundImage:handle_good forState:UIControlStateNormal];
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
