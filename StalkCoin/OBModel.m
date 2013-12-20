//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBModel.h"
#import "OBCoinVO.h"


@implementation OBModel {
}

@synthesize coins;

+ (OBModel*)sharedSingleton {
    static OBModel *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
        coins = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)saveCoin:(OBCoinVO *)coin {
    NSLog(@"What?!");
    [coins addObject:coin];
}


@end