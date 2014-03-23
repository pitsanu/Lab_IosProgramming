//
//  ReminderAppSecondViewController.h
//  ReminderApp
//
//  Created by Tom on 3/22/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ReminderAppSecondViewController : UIViewController
                                             <CLLocationManagerDelegate>

@property (strong, nonatomic) EKEventStore *eventStore;
@property (strong, nonatomic) CLLocationManager *manager;
@property (strong, nonatomic) IBOutlet UITextField *locationText;
- (IBAction)setLocationRemindr:(id)sender;

@end
