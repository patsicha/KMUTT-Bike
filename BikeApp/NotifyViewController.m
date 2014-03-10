//
//  NotifyViewController.m
//  BikeApp
//
//  Created by Patsicha Tongteeka on 3/9/2557 BE.
//  Copyright (c) 2557 Patsicha Tongteeka. All rights reserved.
//
#import "NotifyViewController.h"

@interface NotifyViewController ()
{
    IBOutlet UILabel *lblLocation;
}
@end

@implementation NotifyViewController

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
    
    _mapView.showsUserLocation = YES;
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (
                                        userLocation.location.coordinate, 100, 100);
    [_mapView setRegion:region animated:NO];
    _mapView.delegate = self;
    
    [self startStandardUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapView:(MKMapView *)mapView
didUpdateUserLocation:
(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate =
    userLocation.location.coordinate;
    [self startStandardUpdates];
}
- (IBAction)getCurrentLocation:(id)sender {
    
    lblLocation.text = @"";
    
    MKUserLocation *userLocation = _mapView.userLocation;
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude]; //insert your coordinates
    
    [ceo reverseGeocodeLocation: loc completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        NSLog(@"placemark %@",placemark);
        //String to hold address
        NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
        NSLog(@"addressDictionary %@", placemark.addressDictionary);
        
        NSLog(@"placemark %@",placemark.region);
        NSLog(@"placemark %@",placemark.country);  // Give Country Name
        NSLog(@"placemark %@",placemark.locality); // Extract the city name
        NSLog(@"location %@",placemark.name);
        NSLog(@"location %@",placemark.ocean);
        NSLog(@"location %@",placemark.postalCode);
        NSLog(@"location %@",placemark.subLocality);
        
        NSLog(@"location %@",placemark.location);
        //Print the location to console
        
        NSLog(@"I am currently at %@",locatedAt);
        lblLocation.text = locatedAt;
    }
     ];
    
    
}
- (void)startStandardUpdates
{
    
    lblLocation.text = @"";
    // Create the location manager if this object does not
    // already have one.
    MKUserLocation *userLocation = _mapView.userLocation;
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude]; //insert your coordinates
    
    [ceo reverseGeocodeLocation: loc completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        NSLog(@"placemark %@",placemark);
        //String to hold address
        NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
        NSLog(@"addressDictionary %@", placemark.addressDictionary);
        
        NSLog(@"placemark %@",placemark.region);
        NSLog(@"placemark %@",placemark.country);  // Give Country Name
        NSLog(@"placemark %@",placemark.locality); // Extract the city name
        NSLog(@"location %@",placemark.name);
        NSLog(@"location %@",placemark.ocean);
        NSLog(@"location %@",placemark.postalCode);
        NSLog(@"location %@",placemark.subLocality);
        
        NSLog(@"location %@",placemark.location);
        //Print the location to console
        
        NSLog(@"I am currently at %@",locatedAt);
        lblLocation.text = locatedAt;
        
        
    }
     ];
}
- (IBAction)makeCall:(id)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"facetime:+66869208968"]];
}
@end
