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
#import "OBCoinbaseService.h"
#import "OBCoinVO.h"

@implementation OBAPIService {

}

-(void)getPriceForCoin:(OBCoinVO *)coin {
    NSObject<OBXExchangeServiceProtocol> *service;
    switch(coin.coinExchange){
        case BTCE:
            NSLog(@"Ping Exchange: BTCE");
            service = [[OBBTCEService alloc] init];
            break;
        case MTGOX:
            NSLog(@"Ping Exchange: MTGOX");
            service = [[OBMtGoxService alloc] init];
            break;
        case CRYPTSY:
            NSLog(@"Ping Exchange: CRYPTSY");
            service = [[OBCryptsyService alloc] init];
            break;
        case BITFINEX:
            NSLog(@"Ping Exchange: BITFINEX");
            service = [[OBBitFinexService alloc] init];
            break;
        case COINBASE:
            NSLog(@"Ping Exchange: COINBASE");
            service = [[OBCoinbaseService alloc] init];
            break;
        default:
            NSLog(@"Opps");
        break;

    }
    if(service)
        [service getPriceForCoin:coin];
    else
        NSLog(@"An error has occurred. Trying to request a exchange that doesn't exist");
}

@end