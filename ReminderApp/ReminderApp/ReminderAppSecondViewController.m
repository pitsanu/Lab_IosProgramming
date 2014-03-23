//
//  ReminderAppSecondViewController.m
//  ReminderApp
//
//  Created by Tom on 3/22/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "ReminderAppSecondViewController.h"

@interface ReminderAppSecondViewController ()

@end

@implementation ReminderAppSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setLocationRemindr:(id)sender
{
    if(_eventStore == nil)
    {
        _eventStore = [[EKEventStore alloc]init];
        [_eventStore requestAccessToEntityType:EKEntityTypeReminder
                                    completion:^(BOOL granted, NSError *error) {
            if(!granted)
            {
                NSLog(@"Access to store no granted");
            }
                                    }];
    }
    
    if(_eventStore != nil)
    {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        _manager.distanceFilter = kCLDistanceFilterNone;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        [_manager startUpdatingLocation];
    }
}

#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //NSLog(@"enter updatelocation");
    
    [_manager stopUpdatingLocation];
    EKReminder *reminder = [EKReminder reminderWithEventStore:_eventStore];
    reminder.title = _locationText.text;
    reminder.calendar = [_eventStore defaultCalendarForNewReminders];
    EKStructuredLocation *location = [EKStructuredLocation locationWithTitle:@"Current Location"];
    location.geoLocation = [locations lastObject];
    
    EKAlarm *alarm = [[EKAlarm alloc]init];
    alarm.structuredLocation = location;
    alarm.proximity = EKAlarmProximityLeave;
    [reminder addAlarm:alarm];
    
    NSLog(@"alarm set");
    
    NSError *error = nil;
    [_eventStore saveReminder:reminder commit:YES error:&error];
    
    if(error)
    {
        NSLog(@"error = %@", error);
    }

}

@end
