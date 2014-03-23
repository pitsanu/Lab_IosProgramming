//
//  TBMViewController.h
//  Location
//
//  Created by Tom on 3/20/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TBMViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *latitude;
@property (strong, nonatomic) IBOutlet UILabel *longtitude;
@property (strong, nonatomic) IBOutlet UILabel *horizontalAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *altitude;
@property (strong, nonatomic) IBOutlet UILabel *verticalAccuracy;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *startLocation;

- (IBAction)resetDistance:(id)sender;

@end
