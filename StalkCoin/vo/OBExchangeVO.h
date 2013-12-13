//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface OBExchangeVO : NSObject
{
    NSString *exchangeName;
    NSMutableDictionary *coinEndPoints;
}

- (instancetype)initWithExchangeName:(NSString *)anExchangeName coinEndPoints:(NSMutableDictionary *)aCoinEndPoints;
+ (instancetype)voWithExchangeName:(NSString *)anExchangeName coinEndPoints:(NSMutableDictionary *)aCoinEndPoints;

-(void)getLastPriceForCoin:(NSString*)coin;
-(void)update;


@end