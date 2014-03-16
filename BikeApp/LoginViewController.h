//
//  LoginViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/8/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIButton *btnFacebook;
    IBOutlet UIButton *btnTwitter;
}
@property(nonatomic,retain) NSMutableData *receivedData;

@end
