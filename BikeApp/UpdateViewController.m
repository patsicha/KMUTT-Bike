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
}

@end

@implementation UpdateViewController

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
#define MAXLENGTH 6

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
    if([[txtCode.text substringWithRange:NSMakeRange(2, 4)] isEqualToString:[prefs objectForKey:@"bikeCode"]]) {
    NSString *result = [txtCode.text substringWithRange:NSMakeRange(0, 2)];
    txtCode.text =@"";
    lblError.text = @"";
    NSString *strDurability = [prefs objectForKey:@"DurabilityValue"];
    int durability = [strDurability intValue];
    int down = [result intValue];
    int i;
    NSMutableDictionary *Durability = [[NSMutableDictionary alloc] initWithDictionary:[prefs objectForKey:@"Durability"]];
    for(i = durability ; i > durability - down ; --i) {
        NSLog(@"%i",i);
    if(i == 80) if([[Durability objectForKey:@"wheel"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"wheel"];
    if(i == 70) if([[Durability objectForKey:@"handle"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"handle"];
    if(i == 60) if([[Durability objectForKey:@"break"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"break"];
    if(i == 50) if([[Durability objectForKey:@"saddle"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"saddle"];
    if(i == 40) if([[Durability objectForKey:@"gear"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"gear"];
    if(i == 30) if([[Durability objectForKey:@"pedal"] isEqualToString:@"G"]) [Durability setValue:@"B" forKey:@"pedal"];
        
        
    }
    durability = i;
    strDurability = [[NSString alloc] initWithFormat:@"%d",durability];
    [prefs setObject:strDurability forKey:@"DurabilityValue"];
    NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:Durability];
    [prefs setObject:dict forKey:@"Durability"];
    [[self parentViewController] viewDidLoad];
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

@end
