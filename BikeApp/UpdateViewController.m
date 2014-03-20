//
//  UpdateViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "StatusViewController.h"
#import "UpdateViewController.h"

@interface UpdateViewController () <UITextFieldDelegate>
{
    IBOutlet UITextField *txtCode;
    IBOutlet UILabel *lblError;
    
    NSURLConnection *theConnection;
    NSMutableURLRequest *request;
    UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
}

@end

@implementation UpdateViewController
@synthesize  receivedData;

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
    txtCode.font = segoeui(14);
    lblError.font = segoeuil(12);
    lblError.text = @"";
    txtCode.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
#define MAXLENGTH 7

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= MAXLENGTH || returnKey;
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

- (IBAction)update:(id)sender {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    // NSString *bikeCode = [prefs objectForKey:@"bikeCode"];
    if([txtCode.text length] > 0) {
        if([[txtCode.text substringWithRange:NSMakeRange(2, 5)] isEqualToString:[prefs objectForKey:@"bikeCode"]]) {
            NSString *result = [txtCode.text substringWithRange:NSMakeRange(0, 2)];
            
            NSString *strDurability = [prefs objectForKey:@"DurabilityValue"];
            int durability = [strDurability intValue];
            int down = [result intValue];
            int i;
            NSMutableDictionary *Durability = [[NSMutableDictionary alloc] initWithDictionary:[prefs objectForKey:@"Durability"]];
            for(i = durability ; i > durability - down ; --i) {
                NSLog(@"%i",i);
                if(i == 80) if([[Durability objectForKey:@"wheel"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"wheel"];
                if(i == 70) if([[Durability objectForKey:@"handle"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"handle"];
                if(i == 60) if([[Durability objectForKey:@"break"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"break"];
                if(i == 50) if([[Durability objectForKey:@"saddle"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"saddle"];
                if(i == 40) if([[Durability objectForKey:@"gear"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"gear"];
                if(i == 30) if([[Durability objectForKey:@"pedal"] isEqualToString:@"ni"]) [Durability setValue:@"br" forKey:@"pedal"];
                
                
            }
            durability = i;
            strDurability = [[NSString alloc] initWithFormat:@"%d",durability];
            [prefs setObject:strDurability forKey:@"DurabilityValue"];
            NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:Durability];
            [prefs setObject:dict forKey:@"Durability"];
            [self update_Database];
            
        } else {
            txtCode.text =@"";
            lblError.text = @"Error Bike Code";
            [self shakeView:txtCode];
        }
    }else {
        txtCode.text =@"";
        lblError.text = @"Please Enter Code";
        [self shakeView:txtCode];
    }
}
-(void)update_Database
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *Durability = [[NSMutableDictionary alloc] initWithDictionary:[prefs objectForKey:@"Durability"]];
    NSString *strDurability = [prefs objectForKey:@"DurabilityValue"];
    NSString *post =[NSString stringWithFormat:@"bikeid=%@&break=%@&gear=%@&handle=%@&pedal=%@&saddle=%@&wheel=%@&durability=%@&userid=%@&code=%@&distance=%@", [[prefs objectForKey:@"bikeInfo"] valueForKey:@"bicycle_id"],[Durability objectForKey:@"break"],[Durability objectForKey:@"gear"],[Durability objectForKey:@"handle"],[Durability objectForKey:@"pedal"],[Durability objectForKey:@"saddle"],[Durability objectForKey:@"wheel"],strDurability,[[prefs objectForKey:@"MemberInfo"] valueForKey:@"student_id"],[txtCode text],[txtCode.text substringWithRange:NSMakeRange(0, 2)]];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    NSString *asciiString = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",asciiString);
    
    NSURL *url = [NSURL URLWithString:@"http://kmutt-bike.co.nf/update.php"];
    request = [NSMutableURLRequest requestWithURL:url
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:10.0];
    [request setHTTPMethod:@"POST"];
	[request setHTTPBody:postData];
    
    theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
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
    
    theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
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
    
    
    // 0 = Error
    // 1 = Completed
    
    if(receivedData)
    {
        //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        //[activityView stopAnimating];
        //[loadingView removeFromSuperview];
        
        id jsonObjects = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        
        // value in key name
        NSString *strStatus = [jsonObjects objectForKey:@"Status"];
        NSString *strMessage = [jsonObjects objectForKey:@"Message"];
        
        //NSString *strMemberID = [jsonObjects objectForKey:@"MemberID"];
        NSLog(@"Status = %@",strStatus);
        NSLog(@"Message = %@",strMessage);
        
        NSLog(@"%@",[jsonObjects objectForKey:@"maintain"]);
        
        // Completed
        if( [strMessage isEqualToString:@"UPDATED"] ){
            
            NSMutableArray *bikeInfo = [[NSMutableArray alloc]init];
            bikeInfo = [jsonObjects objectForKey:@"bikeInfo"];
            NSLog(@"%@",bikeInfo);
            
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:bikeInfo forKey:@"bikeInfo"];
            txtCode.text =@"";
            lblError.text = @"";
            [[self parentViewController] viewDidLoad];
            
        }
        else if( [strMessage isEqualToString:@"OK"] ){
            //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            
            
            NSLog(@"OK");
            
        }
        else // Error
        {
            
            theConnection = nil;
            UIAlertView *error =[[UIAlertView alloc]
                                 initWithTitle:@": ( Error!"
                                 message:strMessage delegate:self
                                 cancelButtonTitle:@"OK" otherButtonTitles: nil];
            //[error show];
        }
        
    }
    
    // release the connection, and the data object
}
@end
