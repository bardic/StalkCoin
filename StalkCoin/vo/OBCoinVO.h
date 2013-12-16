/*
 * StalkCoin v 0.1
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
#import "OBDefines.h"


@interface OBCoinVO : NSObject

@property (strong) NSString *coinName;
@property (strong) NSString *coinValue;
@property (strong) NSString *coinPreviousValue;
@property (nonatomic) Exchanges coinExchange;

-(OBCoinVO *)initWithCoinName:(NSString *)coinName andExchange:(Exchanges)exchange andCoinValue:(NSString *)coinValue;
-(NSMutableAttributedString *)toString;
@end