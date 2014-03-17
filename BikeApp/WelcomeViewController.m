//
//  WelcomeViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "WelcomeViewController.h"
#import "YourPageViewController.h"
#import "SettingsViewController.h"

@interface WelcomeViewController ()
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblWelcome;
    IBOutlet UILabel *lblTitleCode;
    IBOutlet UIButton *btnCheckOut;
    NSTimer *timer;
    int x;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIImageView *img0;
    IBOutlet UIImageView *img1;
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UIImageView *img4;
    IBOutlet UILabel *lbl0;
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UILabel *lbl3;
    IBOutlet UILabel *lbl4;
    
    UIImage *imgCheckOut;
    UIImage *imgCancel;
    
    NSMutableURLRequest *request;
    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
    
}
@end

@implementation WelcomeViewController
@synthesize receivedData;

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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableArray *userInfo = [[NSMutableArray alloc] init];
    userInfo = [prefs objectForKey:@"MemberInfo"];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[userInfo valueForKey:@"student_picture"]]]];
    self.imageView.image = image;
    NSString *name = [userInfo valueForKey:@"student_name_en"];
    NSLog(@"%@",userInfo);
    lblName.text = [[NSString alloc] initWithFormat:@"Hi! %@",name ];
    
    
    [self.navigationItem setHidesBackButton:YES];
	// Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    lblName.font = segoeui(26);
    lblWelcome.font = segoeui(13);
    lblTitleCode.font = segoeui(13);
    
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
    lbl4.text = @" ";
    [img0 setHidden:NO];
    [img1 setHidden:NO];
    [img2 setHidden:NO];
    [img3 setHidden:NO];
    [img4 setHidden:NO];
    
    imgCheckOut = [UIImage imageNamed:@"checkout.png"];
    imgCancel = [UIImage imageNamed:@"cancel.png"];
    self.navigationItem.rightBarButtonItem=[self settingsButton];
    
    NSString *model = [[UIDevice currentDevice] model];
    if ([model isEqualToString:@"iPhone Simulator"]) {
        txtPassword.text = @"a0001";
        lbl0.text = @"A";
        lbl1.text = @"0";
        lbl2.text = @"0";
        lbl3.text = @"0";
        lbl4.text = @"1";
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:YES];
        [img4 setHidden:YES];
    }

}

- (UIBarButtonItem *)settingsButton
{
    UIImage *imgUrgent = [UIImage imageNamed:@"gear_setting_white"];
    CGRect buttonFrame = CGRectMake(0, 0, imgUrgent.size.width/2, imgUrgent.size.height/2);
    
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(settingsPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:imgUrgent forState:UIControlStateNormal];
    
    UIBarButtonItem *item= [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}
- (void)settingsPressed
{
    SettingsViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"Settings"];
    svc.delegate = self;
    [self presentPopupViewController:svc animationType:MJPopupViewAnimationSlideTopTop];
}

- (void)okButtonClicked:(SettingsViewController *)aSecondDetailViewController
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:nil  forKey:@"MemberInfo"];
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopBottom];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)cancelButtonClicked:(SettingsViewController *)aSecondDetailViewController
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationSlideTopTop];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)viewDidAppear:(BOOL)animated{
    lblName.alpha = 1;
    lblWelcome.alpha = 1;
    //self.navigationController.navigationBarHidden = NO;
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
        lbl4.text = @" ";
        
        [img0 setHidden:NO];
        [img1 setHidden:NO];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
        [img4 setHidden:NO];
    }
    if([str length]==1)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = @" ";
        lbl2.text = @" ";
        lbl3.text = @" ";
        lbl4.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:NO];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
        [img4 setHidden:NO];
    }
    if([str length]==2)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = @" ";
        lbl3.text = @" ";
        lbl4.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
        [img4 setHidden:NO];
    }
    if([str length]==3)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:2] ];
        lbl3.text = @" ";
        lbl4.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:NO];
        [img4 setHidden:NO];
    }
    if([str length]==4)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:2] ];
        lbl3.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:3] ];
        lbl4.text = @" ";
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:YES];
        [img4 setHidden:NO];
    }
    if([str length]==5)
    {
        lbl0.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:0] ];
        lbl1.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:1] ];
        lbl2.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:2] ];
        lbl3.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:3] ];
        lbl4.text = [[NSString alloc] initWithFormat:@"%c",[str characterAtIndex:4] ];
        
        [img0 setHidden:YES];
        [img1 setHidden:YES];
        [img2 setHidden:YES];
        [img3 setHidden:YES];
        [img4 setHidden:YES];
    }

}
#define MAX_LENGTH 5

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
    if(x!=0)
    {
        [btnCheckOut setBackgroundImage:imgCheckOut forState:UIControlStateNormal];
        [lblWelcome setText:@"Welcome ^ ^"];
        [timer invalidate];
        txtPassword.text = @"";
        lbl0.text = @" ";
        lbl1.text = @" ";
        lbl2.text = @" ";
        lbl3.text = @" ";
        lbl4.text = @" ";
        
        [img0 setHidden:NO];
        [img1 setHidden:NO];
        [img2 setHidden:NO];
        [img3 setHidden:NO];
        [img4 setHidden:NO];
        
        x=0;
    }else{
    if([txtPassword.text length] == 5 ){
        if([[lblWelcome text] isEqualToString:@"Welcome ^ ^"] || [[lblWelcome text] isEqualToString:@"Please enter a valid code :)"])
        {
            x =0;
            [lblWelcome setText:@"Pending"];
            [btnCheckOut setBackgroundImage:imgCancel forState:UIControlStateNormal];
            timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        }else{
            [btnCheckOut setBackgroundImage:imgCheckOut forState:UIControlStateNormal];
            [lblWelcome setText:@"Welcome ^ ^"];
            [timer invalidate];
        }
    }else{
        
        [self shakeView:img0];
        [self shakeView:img1];
        [self shakeView:img2];
        [self shakeView:img3];
        [lblWelcome setText:@"Please enter a valid code :)"];
        
    }
    }
    
}
-(void)timerFired
{
    if( ++x == 5) [self goYourBike];
    [lblWelcome setText:[[NSString alloc]initWithFormat:@" %@.",[lblWelcome text]]];
    if([[lblWelcome text] isEqualToString:@"    Pending...."])
        [lblWelcome setText:@"Pending"];
}


- (void)goYourBike {
    [UIView  beginAnimations: @"nextPage"context: nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [self.imageView setCenter:CGPointMake(75, 64)];
    lblName.alpha = 0;
    lblWelcome.alpha = 0;
    [UIView commitAnimations];
}
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    if([animationID isEqualToString:@"nextPage"]){
        YourPageViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"YourBike"];
        CATransition* transition = [CATransition animation];
        transition.duration = 1;
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromTop;
        svc.bikeCode = [[txtPassword text] uppercaseString];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:[[txtPassword text] uppercaseString]  forKey:@"bikeCode"];
        [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
        [self.navigationController pushViewController:svc animated:NO];
    }
}
- (void)rent_bike
{
    
    // 0 - WRONGUSER
    // 1 - WRONGPASSWORD
    // 2 - PASS
    NSString *post =[NSString stringWithFormat:@"bikecode=%@", txtPassword.text];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *asciiString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",asciiString);
    
    NSURL *url = [NSURL URLWithString:@"http://kmutt-bike.co.nf/rent_bike.php"];
    request = [NSMutableURLRequest requestWithURL:url
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
	[request setHTTPBody:postData];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) {
        self.receivedData = [NSMutableData data];
    } else {
		UIAlertView *connectFailMessage = [[UIAlertView alloc] initWithTitle:@"NSURLConnection " message:@"Failed in viewDidLoad"  delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[connectFailMessage show];
        
    }
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //sleep(0);
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (theConnection) {
        self.receivedData = [NSMutableData data];
    } else {
		UIAlertView *connectFailMessage = [[UIAlertView alloc] initWithTitle:@"NSURLConnection " message:@"Failed in viewDidLoad"  delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
		[connectFailMessage show];
        
    }
    //inform the user
    NSLog(@"Connection failed! Error - %@", [error localizedDescription]);
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Hide Progress
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [activityView stopAnimating];
    [loadingView removeFromSuperview];
 
    // 0 = Error
    // 1 = Completed
    
    if(receivedData)
    {
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        
        // value in key name
        NSString *strStatus = [jsonObjects objectForKey:@"Status"];
        NSString *strMessage = [jsonObjects objectForKey:@"Message"];
        //NSString *strMemberID = [jsonObjects objectForKey:@"MemberID"];
        NSLog(@"Status = %@",strStatus);
        NSLog(@"Message = %@",strMessage);
        //NSLog(@"MemberID = %@",strMemberID);
        
        // Completed
        if( [strStatus isEqualToString:@"1"] ){
            
            
            NSMutableArray *bikeInfo = [[NSMutableArray alloc] init];
            bikeInfo = [jsonObjects objectForKey:@"Bike"];
            
            NSLog(@"%@",bikeInfo);
            // values in foreach loop
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:bikeInfo  forKey:@"BikeInfo"];
            /*
             [prefs setObject:[jsonObjects objectForKey:@"Program"]  forKey:@"Program"];
             [prefs setObject:[jsonObjects objectForKey:@"Calendar"]  forKey:@"Calendar"];
             [prefs setObject:[jsonObjects objectForKey:@"ProgramDetail"]  forKey:@"ProgramDetail"];
             
             [self textFieldDidEndEditing:usernameField];
             [self textFieldDidEndEditing:passwordField];
             UIStoryboard *storyboard = self.storyboard;
             MainMenuViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
             //svc.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
             usernameField.text = @"";
             passwordField.text = @"";
             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
             
             [EEHUDView growlWithMessage:@"welcome"
             showStyle:EEHUDViewShowStyleShake
             hideStyle:EEHUDViewHideStyleFadeOut
             resultViewStyle:EEHUDResultViewStyleChecked
             showTime:2.0];
             
             
             
             [EEHUDView growlWithMessage:@"welcome"
             showStyle:EEHUDViewShowStyleFadeIn
             hideStyle:EEHUDViewHideStyleFadeOut
             resultViewStyle:EEHUDResultViewStyleChecked
             showTime:1.0];
             
            FirstViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
            [svc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:svc animated:YES completion:nil];
             */
            
        }
        else // Error
        {
            UIAlertView *error =[[UIAlertView alloc]
                                 initWithTitle:@": ( Error!"
                                 message:strMessage delegate:self
                                 cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [error show];
        }
        
    }
    
    // release the connection, and the data object
}

@end
