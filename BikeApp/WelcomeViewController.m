//
//  WelcomeViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "WelcomeViewController.h"
#import "YourPageViewController.h"

@interface WelcomeViewController ()
{
    IBOutlet UILabel *txtName;
    IBOutlet UILabel *txtWelcome;
    IBOutlet UIButton *btnCheckOut;
    NSTimer *timer;
    int x;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIImageView *img0;
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UILabel *lbl0;
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UILabel *lbl3;
    
    UIImage *imgCheckOut;
    UIImage *imgCancel;
}
@end

@implementation WelcomeViewController

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
	// Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    UIColor *topColor = [UIColor colorWithRed:255/255.0f green:195/255.0f blue:64/255.0f alpha:1.0f];
    [self.navigationController.navigationBar setBarTintColor:topColor];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      segoeuib(20),
      NSFontAttributeName,[UIColor whiteColor],
      NSForegroundColorAttributeName, nil]];
    
    
    self.imageView.image = [self.imageView.image resizedImageWithContentMode:UIViewContentModeScaleAspectFill bounds:CGSizeMake(100, 100) interpolationQuality:kCGInterpolationHigh];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height /2;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.contentMode = UIViewContentModeTop;
    self.imageView.clipsToBounds = YES;
    
    txtPassword.tintColor = [UIColor clearColor];
    txtPassword.textColor = [UIColor clearColor];
    txtPassword.delegate = self;
    
    lbl0.text = @" ";
    lbl1.text = @" ";
    lbl2.text = @" ";
    lbl3.text = @" ";
    
    [img0 setHidden:NO];
    [img1 setHidden:NO];
    [img2 setHidden:NO];
    [img3 setHidden:NO];
    
    imgCheckOut = [UIImage imageNamed:@"checkout.png"];
    imgCancel = [UIImage imageNamed:@"cancel.png"];
}

- (void)viewDidAppear:(BOOL)animated{
    txtName.alpha = 1;
    txtWelcome.alpha = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
- (IBAction)changed:(id)sender {
    NSLog(@"%@",[txtPassword text]);
    NSString *str = [[txtPassword text] uppercaseString];
    
    if([str length] == 0)
    {
        lbl0.text = @" ";
        lbl1.text = @" ";
        lbl2.text = @" ";
        lbl3.text = @" ";
        
        [img0 setHidden:NO];
        [img1 setHidden:NO];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
    }
    if([str length]==1)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = @" ";
        lbl2.text = @" ";
        lbl3.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:NO];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
    }
    if([str length]==2)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = @" ";
        lbl3.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
    }
    if([str length]==3)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:2] ];
        lbl3.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:NO];
    }
    if([str length]==4)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:2] ];
        lbl3.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:3] ];
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:YES];
    }

}
#define MAX_LENGTH 4

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger newLength = [txtPassword.text length] + [string length] - range.length;
    
    if(newLength > MAX_LENGTH){
        
        return NO;
    }
    else{
        return YES;
    }
}
- (IBAction)editPassword:(id)sender {
    [txtPassword becomeFirstResponder];
}

-(void)shakeView:(UIImageView *)lockImage {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint:
                         CGPointMake(lockImage.center.x - 5,lockImage.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint:
                       CGPointMake(lockImage.center.x + 5, lockImage.center.y)]];
    [lockImage.layer addAnimation:shake forKey:@"position"];
}

- (IBAction)checkOut:(id)sender {
    if([txtPassword.text length] == 4) {
        if([[txtWelcome text] isEqualToString:@"Welcome ^ ^"])
        {
            x =0;
            [txtWelcome setText:@"Pending"];
            [btnCheckOut setBackgroundImage:imgCancel forState:UIControlStateNormal];
            timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        }else{
            [btnCheckOut setBackgroundImage:imgCheckOut forState:UIControlStateNormal];
            [txtWelcome setText:@"Welcome ^ ^"];
            [timer invalidate];
        }
    }else{
        
        [self shakeView:img0];
        [self shakeView:img1];
        [self shakeView:img2];
        [self shakeView:img3];
    }
    
}
-(void)timerFired
{
    if( ++x == 10) [self goYourBike];
    [txtWelcome setText:[[NSString alloc]initWithFormat:@" %@.",[txtWelcome text]]];
    if([[txtWelcome text] isEqualToString:@"    Pending...."])
        [txtWelcome setText:@"Pending"];
}


- (void)goYourBike {
    [UIView  beginAnimations: @"nextPage"context: nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [self.imageView setCenter:CGPointMake(75, 64)];
    txtName.alpha = 0;
    txtWelcome.alpha = 0;
    [UIView commitAnimations];
}
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if([animationID isEqualToString:@"nextPage"]){
        YourPageViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"YourBike"];
        CATransition* transition = [CATransition animation];
        transition.duration = 1;
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromTop;
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:svc animated:NO];
    }
}


@end
