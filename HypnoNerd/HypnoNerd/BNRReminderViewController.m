//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Tom on 3/10/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end


@implementation BNRReminderViewController

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting  reminder for %@", date);
}


@end
