//
//  ReminderAppFirstViewController.m
//  ReminderApp
//
//  Created by Tom on 3/22/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "ReminderAppFirstViewController.h"

@interface ReminderAppFirstViewController ()

@end

@implementation ReminderAppFirstViewController

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

- (IBAction)setReminder:(id)sender
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
        [self createReminder];
    }
}

-(void)createReminder
{
    EKReminder *reminder = [EKReminder reminderWithEventStore:_eventStore];
    
    reminder.title = _reminderText.text;
    reminder.calendar = [_eventStore defaultCalendarForNewReminders];
    NSDate *date = [_myDatePicker date];
    EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];
    [reminder addAlarm:alarm];
    NSError *error = nil;
    [_eventStore saveReminder:reminder commit:YES error:&error];
    
    if(error)
    {
        NSLog(@"error = %@", error);
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    if([_reminderText isFirstResponder] && [touch view] != _reminderText)
    {
        [_reminderText resignFirstResponder];
    }
    
    [super touchesBegan:touches withEvent:event];
}
@end
