//
//  TBMViewController.m
//  Location
//
//  Created by Tom on 3/20/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "TBMViewController.h"

@interface TBMViewController ()

@end

@implementation TBMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    [_locationManager startUpdatingLocation];
    _startLocation = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetDistance:(id)sender {
    _startLocation = nil;
}

#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations lastObject];
    
    NSString *currentLatitude = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.coordinate.latitude];
    _latitude.text = currentLatitude;
    
    NSString *currentLongitude = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.coordinate.longitude];
    _longtitude.text = currentLongitude;
    
    NSString *currentHorizontalAccuracy = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.horizontalAccuracy];
    _horizontalAccuracy.text = currentHorizontalAccuracy;

    NSString *currentAltitude = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.altitude];
    _altitude.text = currentAltitude;

    NSString *currentVerticalAccuracy = [[NSString alloc]initWithFormat:@"%+.6f", newLocation.verticalAccuracy];
    _verticalAccuracy.text = currentVerticalAccuracy;
    
    if(_startLocation == nil){
        _startLocation = newLocation;
    }
    
    CLLocationDistance distanceBetween = [newLocation distanceFromLocation:_startLocation];
    NSString *tripString = [[NSString alloc]initWithFormat:@"%f", distanceBetween];
    _distance.text = tripString;
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

@end
