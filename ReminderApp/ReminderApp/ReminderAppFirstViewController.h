//
//  ReminderAppFirstViewController.h
//  ReminderApp
//
//  Created by Tom on 3/22/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface ReminderAppFirstViewController : UIViewController
@property (strong, nonatomic) EKEventStore *eventStore;
@property (strong, nonatomic) IBOutlet UITextField *reminderText;
@property (strong, nonatomic) IBOutlet UIDatePicker *myDatePicker;

- (IBAction)setReminder:(id)sender;

@end
