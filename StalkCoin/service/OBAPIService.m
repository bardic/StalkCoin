/*
 * StalkCoin v 0.2
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42+1):
 * <bardic.knowledge@gmail.com> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return or contribute to my beer fund
 * via Bitcoin and/or Litecoin:
 *
 * Bitcoin: 1GWGoT9r6wAgdERT7QogehPvaaUUEohcEQ
 * Litecoin: LVFwvucM5mTdFKxfgfQbMEqaC7rE3tncEM
 * ----------------------------------------------------------------------------
 */

#import "OBAPIService.h"
#import "OBDefines.h"
#import "OBBTCEService.h"
#import "OBMtGoxService.h"
#import "OBCryptsyService.h"
#import "OBBitFinexService.h"
#import "OBCoinVO.h"
#import "OBCoinBaseService.h"

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
            service = [[OBCoinBaseService alloc] init];
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