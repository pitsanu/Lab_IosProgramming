//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Tom on 3/9/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

-(void)loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    self.view = backgroundView;
}

@end
