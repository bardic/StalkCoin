//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBAPIService.h"
#import "OBExchangeVO.h"

//Coins
NSString * const LTC = @"LTC";
NSString * const BTC = @"BTC";
NSString * const FTC = @"FTC";

//Exchangeds
NSString * const BTCE = @"BTCE";



@implementation OBAPIService {
    NSMutableDictionary *endPoints;
}

-(id)init{
    NSMutableDictionary *btceEndPointDict = [NSMutableDictionary new];
    [btceEndPointDict insertValue:@"https://btc-e.com/api/2/ltc_usd/ticker" inPropertyWithKey:LTC];
    [btceEndPointDict insertValue:@"https://btc-e.com/api/2/btc_usd/ticker" inPropertyWithKey:BTC];

    [endPoints insertValue:[OBExchangeVO voWithExchangeName:BTCE coinEndPoints:btceEndPointDict] inPropertyWithKey:BTCE];

    return self;
}

-(void)callAPI{

}
@end