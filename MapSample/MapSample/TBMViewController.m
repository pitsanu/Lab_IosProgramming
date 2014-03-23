//
//  TBMViewController.m
//  MapSample
//
//  Created by Tom on 3/22/14.
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
    
    _mapView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)zoomIn:(id)sender
{
    MKUserLocation *userLocation = _mapView.userLocation;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 20000, 20000);
    [_mapView setRegion:region animated:YES];
}

- (IBAction)changeMapType:(id)sender
{
    if(_mapView.mapType == MKMapTypeStandard)
    {
        _mapView.mapType = MKMapTypeSatellite;
    }
    else
    {
        _mapView.mapType = MKMapTypeStandard;
    }
}

#pragma mark MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

@end
