//
//  TBMViewController.h
//  Location
//
//  Created by Tom on 3/20/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
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
=======

@interface TBMViewController : UIViewController
>>>>>>> 00d4ea5d016f2e2ef58c5e4a61aac0dcb73bbd6b

@end
