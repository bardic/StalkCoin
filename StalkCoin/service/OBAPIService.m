//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBAPIService.h"
#import "OBDefines.h"
#import "OBBTCEService.h"
#import "OBMtGoxService.h"
#import "OBCryptsyService.h"
#import "OBBitFinexService.h"

@implementation OBAPIService {

}

- (void)getPricesForExchange:(int)exchange andCoins:(NSString *)coins {
    NSObject<OBXExchangeServiceProtocol> *service;
    switch(exchange){
        case BTCE:
            service = [[OBBTCEService alloc] init];
            break;
        case MTGOX:
            service = [[OBMtGoxService alloc] init];
            break;
        case CRYPTSY:
            service = [[OBCryptsyService alloc] init];
            break;
        case BITFINEX:
            service = [[OBBitFinexService alloc] init];
            break;
        default:
            NSLog(@"Opps");
        break;

    }

    [service getPricesForCoins:@[LTC, BTC]];
}

@end