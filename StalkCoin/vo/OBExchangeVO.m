//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBExchangeVO.h"


@implementation OBExchangeVO {

}

- (instancetype)initWithExchangeName:(NSString *)anExchangeName coinEndPoints:(NSMutableDictionary *)aCoinEndPoints {
    self = [super init];
    if (self) {
        exchangeName = anExchangeName;
        coinEndPoints = aCoinEndPoints;
    }

    return self;
}

+ (instancetype)voWithExchangeName:(NSString *)anExchangeName coinEndPoints:(NSMutableDictionary *)aCoinEndPoints {
    return [[self alloc] initWithExchangeName:anExchangeName coinEndPoints:aCoinEndPoints];
}

- (void)getLastPriceForCoin:(NSString *)coin {
    //This is a bad way to achieve this. Consider other methods.
    [NSException raise:@"Uncompleted Exchange VO" format:@"Function getLastPriceForCoin must be overridden by ancestor"];
}

- (void)update {
    //This is a bad way to achieve this. Consider other methods.
    [NSException raise:@"Uncompleted Exchange VO" format:@"Function update must be overridden by ancestor"];
}


@end