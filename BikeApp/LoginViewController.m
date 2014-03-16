//
//  LoginViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "LoginViewController.h"
#import "FirstViewController.h"

@interface LoginViewController ()
{
    NSMutableURLRequest *request;
    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
}
@end

@implementation LoginViewController
@synthesize receivedData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)fontall
{
    for(NSString* family in [UIFont familyNames]) {
        NSLog(@"%@", family);
        for(NSString* name in [UIFont fontNamesForFamilyName: family]) {
            NSLog(@"  %@", name);
        }
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUI];
    //[self fontall];
    
}
-(void) viewDidAppear:(BOOL)animated
{
    txtUsername.text = @"";
    txtPassword.text = @"";
}
- (IBAction)login:(id)sender {
    
    [txtUsername endEditing:YES];
    [txtPassword endEditing:YES];
    
    NSString *username = txtUsername.text;
    NSString *password = txtPassword.text;
    
    //[self textFieldDidEndEditing:usernameField];
    //[self textFieldDidEndEditing:passwordField];
    
    if([username isEqualToString:@""] )
    {
        //[self redborderTextField:usernameField];
        [EEHUDView growlWithMessage:@"missing username?"
                          showStyle:EEHUDViewShowStyleShake
                          hideStyle:EEHUDViewHideStyleFadeOut
                    resultViewStyle:EEHUDResultViewStyleNG
                           showTime:1.0];
        return;
    }
    if([password isEqualToString:@""] )
    {
        //[self redborderTextField:usernameField];
        [EEHUDView growlWithMessage:@"missing password?"
                          showStyle:EEHUDViewShowStyleShake
                          hideStyle:EEHUDViewHideStyleFadeOut
                    resultViewStyle:EEHUDResultViewStyleNG
                           showTime:1.0];
        return;
    }
    
    
    if(![username isEqualToString:@""] && ![password isEqualToString:@""]) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        loadingView = [[UIView alloc] initWithFrame:CGRectMake(130, 250, 68, 68)];
        loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        loadingView.clipsToBounds = YES;
        loadingView.layer.cornerRadius = 10.0;
        
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView.frame = CGRectMake(15 , 15, activityView.bounds.size.width, activityView.bounds.size.height);
        [loadingView addSubview:activityView];
        
        [self.view addSubview:loadingView];
        [activityView startAnimating];
        
        [self checkLogin];
        
    }    /*
    
    if([txtUsername.text isEqualToString:@"53211536"] && [txtPassword.text isEqualToString:@"1234"])
    {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:txtUsername.text  forKey:@"MemberInfo"];
        
        txtUsername.text = @"";
        txtPassword.text = @"";
        
        

        FirstViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
        [svc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:svc animated:YES completion:nil];
    }
    else{
        
    }
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUI
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtUsername.leftView = paddingView;
    txtUsername.leftViewMode = UITextFieldViewModeAlways;
    paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    txtPassword.leftView = paddingView;
    txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
    [btnFacebook setBackgroundImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [btnFacebook setBackgroundImage:[UIImage imageNamed:@"facebook_click.png"] forState:UIControlStateHighlighted];
    [btnTwitter setBackgroundImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    [btnTwitter setBackgroundImage:[UIImage imageNamed:@"twitter_click.png"] forState:UIControlStateHighlighted];
    
}
- (IBAction)facebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/KMUTTVolunteer"]];
}
- (IBAction)twitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/kmuttbike"]];
}

- (void)checkLogin
{
    
    // 0 - WRONGUSER
    // 1 - WRONGPASSWORD
    // 2 - PASS
    NSString *post =[NSString stringWithFormat:@"username=%@&password=%@",txtUsername.text, txtPassword.text];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *asciiString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",asciiString);
    
    NSURL *url = [NSURL URLWithString:@"http://kmutt-bike.co.nf/login.php"];
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
    
    // Return Status E.g : { "Status":"1", "Message":"Insert Data Successfully" }
    // 0 = Error
    // 1 = Completed
    
    if(receivedData)
    {
        // NSLog(@"%@",receivedData);
        
        // NSString *dataString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
        // NSLog(@"%@",dataString);
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        
        // value in key name
        NSString *strStatus = [jsonObjects objectForKey:@"Status"];
        NSString *strMessage = [jsonObjects objectForKey:@"Message"];
        //NSString *strMemberID = [jsonObjects objectForKey:@"MemberID"];
        NSLog(@"Status = %@",strStatus);
        NSLog(@"Message = %@",strMessage);
        //NSLog(@"MemberID = %@",strMemberID);
        
        // Completed
        if( [strStatus isEqualToString:@"2"] ){
            
            
            NSMutableArray *memberInfo = [[NSMutableArray alloc] init];
            memberInfo = [jsonObjects objectForKey:@"User"];
            /*
            NSDictionary *dict;
            dict = [NSDictionary dictionaryWithObjectsAndKeys:
                    [jsonObjects objectForKey:@"name"], @"name",
                    [jsonObjects objectForKey:@"email"], @"email",
                    [jsonObjects objectForKey:@"gender"], @"gender",
                    [jsonObjects objectForKey:@"birthday"], @"birthday",
                    [jsonObjects objectForKey:@"weight"], @"weight",
                    [jsonObjects objectForKey:@"height"], @"height",
                    [jsonObjects objectForKey:@"MemberID"], @"id",
                    nil];
            [memberInfo addObject:dict];
             */
            
            NSLog(@"%@",memberInfo);
            // values in foreach loop
            
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:[memberInfo objectAtIndex:0]  forKey:@"MemberInfo"];
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
            */
            
            
            [EEHUDView growlWithMessage:@"welcome"
                              showStyle:EEHUDViewShowStyleFadeIn
                              hideStyle:EEHUDViewHideStyleFadeOut
                        resultViewStyle:EEHUDResultViewStyleChecked
                               showTime:1.0];
            FirstViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
            [svc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:svc animated:YES completion:nil];

        }
        else if([strStatus isEqualToString:@"1"])
        {
            /*
            [self redborderTextField:passwordField];
             */
            txtPassword.text = @"";
             
            [txtPassword becomeFirstResponder];
            [EEHUDView growlWithMessage:@"wrong password"
                              showStyle:EEHUDViewShowStyleShake
                              hideStyle:EEHUDViewHideStyleFadeOut
                        resultViewStyle:EEHUDResultViewStyleNG
                               showTime:1.0];
             
        }
        else if([strStatus isEqualToString:@"0"])
        {
            /*
            [self redborderTextField:usernameField];
             */
            txtUsername.text = @"";
            txtPassword.text = @"";
            [txtUsername becomeFirstResponder];
            [EEHUDView growlWithMessage:@"wrong username"
                              showStyle:EEHUDViewShowStyleShake
                              hideStyle:EEHUDViewHideStyleFadeOut
                        resultViewStyle:EEHUDResultViewStyleNG
                               showTime:1.0];
             
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
