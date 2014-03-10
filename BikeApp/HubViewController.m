//
//  HubViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/10/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "HubViewController.h"

@interface HubViewController ()

@property (weak, nonatomic) IBOutlet UITextView *info;
@end

@implementation HubViewController

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
    _info.text = @"ฉีดน้ำเสร็จสิ่งสกปรกจากเนื้อยางหลังจากเสร็จการเดินทาง \n\nตรวจเช็คลมยาง พยายามอย่าขี่เวลายางแบน \n\nสังเกตุบริเวณขอบยางจะมีเลขบอกว่ายางนั้นควยจะเติมลมยางเท่าไหร่ถึงจะเหมาะ";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
