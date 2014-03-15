//
//  StatusViewController.h
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusViewController : UIViewController
{
    IBOutlet UILabel *lblTxt;
    IBOutlet UIButton *btnGear;
    IBOutlet UIButton *btnWheel;
    IBOutlet UIButton *btnBreak;
    IBOutlet UIButton *btnSaddle;
    IBOutlet UIButton *btnPedal;
    IBOutlet UIButton *btnHandle;
}
- (IBAction)selected:(id)sender;
@end
