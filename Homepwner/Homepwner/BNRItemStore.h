//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Tom on 3/16/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property(nonatomic, readonly) NSArray *allItems;

+(instancetype)sharedStore;

-(BNRItem *)createItem;
@end
