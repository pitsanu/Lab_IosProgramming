//
//  TBMViewController.h
//  MapSample
//
//  Created by Tom on 3/22/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TBMViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)zoomIn:(id)sender;
- (IBAction)changeMapType:(id)sender;

@end
