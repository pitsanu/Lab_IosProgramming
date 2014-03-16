//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Tom on 3/16/14.
//  Copyright (c) 2014 The Big Mud. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()

@property(nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

#pragma mark INITIALIZERS
+(instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    // Do I need to create a sharedStore?
    if(!sharedStore)
    {
        sharedStore = [[self alloc]initPrivate];
    }
    return sharedStore;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use + [BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

-(instancetype)initPrivate
{
    self = [super init];
    if(self)
    {
        _privateItems = [[NSMutableArray alloc]init];
    }
    
    return self;
}

#pragma mark IMPLEMENTATIONS
-(NSArray *)allItems
{
    return self.privateItems;
}

-(BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
  
    return item;
}
@end
