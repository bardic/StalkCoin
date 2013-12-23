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
#import "OBCoinVO.h"


@implementation OBCoinVO

static NSString* UP_ARROW = @"\u2191";
static NSString* DOWN_ARROW = @"\u2193";

- (BOOL)valueIncreased {
    if([_coinValue intValue] > [_coinPreviousValue intValue]){
        return YES;
    }

    return NO;
}

- (void)setCoinValue:(NSString *)coinValue {
    _coinPreviousValue = _coinValue;
    _coinValue = coinValue;
}


- (OBCoinVO *)initWithCoinName:(NSString *)coinName andExchange:(Exchanges)exchange andCoinValue:(NSString *)coinValue andCurrency:(NSString *)coinCurrency {
    self = [super init];
    if (self) {
        _coinPreviousValue = @"0";
        _coinName = coinName;
        _coinExchange = exchange;
        _coinValue = [NSString stringWithFormat:@"%@", coinValue];
        _coinCurrency = coinCurrency;
    }

    return self;
}

- (NSMutableString *)toString {
    NSLog(@"Exchange: %i Coin: %@",_coinExchange ,_coinName);
    NSColor * color = [NSColor blackColor];
    NSString * arrow = @"";
    if([_coinPreviousValue intValue] != 0 || [_coinPreviousValue intValue] == [_coinValue intValue]){
        if([self valueIncreased]){
            arrow = UP_ARROW;
            //color = [NSColor colorWithRed:5 green:225 blue:0 alpha:1];
        }else{
            arrow = DOWN_ARROW;
            //color = [NSColor colorWithRed:125 green:0 blue:0 alpha:1];
        }
    }

    NSString *exchange = @"";
    switch(_coinExchange){
        case BTCE:
            exchange = @"BTCE";
            break;
        case MTGOX:
            exchange = @"MTGOX";
            break;
        case CRYPTSY:
            exchange = @"CRYPTSY";
            break;
        case BITFINEX:
             exchange = @"BITFINEX";
            break;
        case COINBASE:
            exchange = @"COINBASE";
            break;
    }

    NSMutableString * baseString;
    if(_coinValue){
        if(_coinValue.length > MAX_CHAR_COUNT){
            _coinValue  = [[_coinValue substringWithRange:NSMakeRange(0, MAX_CHAR_COUNT)] mutableCopy];
        }

        baseString = [NSMutableString stringWithFormat:@"%@%@ - %@: %@/%@",arrow,exchange,_coinName,_coinValue, _coinCurrency];
    }else{
        baseString = [@"Loading..." mutableCopy];
    }

    NSMutableAttributedString *coinString = [[NSMutableAttributedString alloc] initWithString:baseString];

    NSFont *font = [NSFont fontWithName:@"LucidaGrande" size:10.0];
    [coinString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, coinString.length)];
    [coinString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, coinString.length)];

    return coinString;
}

@end