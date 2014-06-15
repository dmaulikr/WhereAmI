//
//  mapViewController.m
//  fileuploader
//
//  Created by Vaibhav Malpani on 5/10/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()

@end

@implementation mapViewController

@synthesize mapView;

@synthesize location;
@synthesize nearbyLocation1;
@synthesize nearbyLocation2;

@synthesize destName;
@synthesize nearbyLocName1;
@synthesize nearbyLocName2;

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
    self.mapView.delegate = self;
    self.mapView.zoomEnabled = YES;

}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 750, 750);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];

    
    // Add destination annotation
    MKPointAnnotation *pointUser = [[MKPointAnnotation alloc] init];
    pointUser.coordinate = location;
    pointUser.title = @"Destination!";
    pointUser.subtitle = destName;
    [self.mapView addAnnotation:pointUser];
    [self.mapView selectAnnotation:pointUser animated:YES];

    // Add nearby location annotation
    MKPointAnnotation *pointNearby1 = [[MKPointAnnotation alloc] init];
    pointNearby1.coordinate = nearbyLocation1;
    pointNearby1.title = @"Nearby!";
    pointNearby1.subtitle = nearbyLocName1;
    [self.mapView addAnnotation:pointNearby1];
    [self.mapView selectAnnotation:pointNearby1 animated:YES];

    // Add nearby location annotation
    MKPointAnnotation *pointNearby2 = [[MKPointAnnotation alloc] init];
    pointNearby2.coordinate = nearbyLocation2;
    pointNearby2.title = @"Nearby!";
    pointNearby2.subtitle = nearbyLocName2;
    [self.mapView addAnnotation:pointNearby2];
    [self.mapView selectAnnotation:pointNearby2 animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
