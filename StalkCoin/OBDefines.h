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

#import <Foundation/Foundation.h>

//Coins
extern NSString * const LTC;
extern NSString * const BTC;
extern NSString * const FTC;
extern NSString * const QRK;
extern NSUInteger MAX_CHAR_COUNT;

typedef enum{
    BTCE,
    MTGOX,
    CRYPTSY,
    BITFINEX,
    COINBASE
}Exchanges;

@interface OBDefines : NSObject
@end