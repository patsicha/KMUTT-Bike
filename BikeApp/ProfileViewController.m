//
//  ProfileViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UIImageView *img = (UIImageView *)[cell viewWithTag:100];
    UILabel *name = (UILabel *)[cell viewWithTag:101];
    UILabel *info = (UILabel *)[cell viewWithTag:102];
    name.font = segoeui(10);
    info.font = segoeuil(9);
    if(indexPath.row == 0)
    {
        img.image = [UIImage imageNamed:@"10km.png"];
        name.text = @"Ten Traveler";
        info.text = @"Ride bicycle reach overall 10 kilometer.";
    }
    
    else if(indexPath.row == 1)
    {
        img.image = [UIImage imageNamed:@"20km.png"];
        name.text = @"Twenty Reach!";
        info.text = @"Ride bicycle reach overall 20 kilometer.";
    }
    
    else if(indexPath.row == 2)
    {
        img.image = [UIImage imageNamed:@"50km_d.png"];
        name.text = @"Fifty Guts!";
        info.text = @"Ride bicycle reach overall 50 kilometer.";
    }
    
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


@end
