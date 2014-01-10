//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>

//Coins
extern NSString * const LTC;
extern NSString * const BTC;
extern NSString * const FTC;
extern NSString * const QRK;
extern int const MAX_CHAR_COUNT;

typedef enum{
    BTCE,
    MTGOX,
    CRYPTSY,
    BITFINEX,
    COINBASE
}Exchanges;

@interface OBDefines : NSObject
@end