//
//  mapViewController.h
//  fileuploader
//
//  Created by Arihant Kochhar on 5/10/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapViewController : UIViewController <MKMapViewDelegate>;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property  (nonatomic) CLLocationCoordinate2D location;
@property  (nonatomic) CLLocationCoordinate2D nearbyLocation1;
@property  (nonatomic) CLLocationCoordinate2D nearbyLocation2;

@property (strong, nonatomic) NSString *destName;
@property (strong, nonatomic) NSString *nearbyLocName1;
@property (strong, nonatomic) NSString *nearbyLocName2;
@end
