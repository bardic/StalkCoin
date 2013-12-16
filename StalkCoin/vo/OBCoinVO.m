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
#import "OBCoinVO.h"


@implementation OBCoinVO {
@private
    NSString *_coinValue;
}

static NSString* UP_ARROW = @"\u2191";
static NSString* DOWN_ARROW = @"\u2193";

@synthesize coinValue = _coinValue;

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


-(OBCoinVO *)initWithCoinName:(NSString *)coinName andExchange:(Exchanges)exchange andCoinValue:(NSString *)coinValue{
    self = [super init];
    if (self) {
        _coinPreviousValue = @"0";
        _coinName = coinName;
        _coinExchange = exchange;
        _coinValue = coinValue;
    }

    return self;
}

- (NSMutableAttributedString *)toString {
    NSColor * color = [NSColor blackColor];
    NSString * arrow = @"";
    if([_coinPreviousValue intValue] != 0 || [_coinPreviousValue intValue] == [_coinValue intValue]){
        if([self valueIncreased]){
            arrow = UP_ARROW;
            color = [NSColor colorWithRed:0 green:160 blue:0 alpha:1];
        }else{
            arrow = DOWN_ARROW;
            color = [NSColor colorWithRed:160 green:0 blue:0 alpha:1];
        }
    }

    NSString * baseString = [NSString stringWithFormat:@"%@ %@: $%@",arrow,_coinName,_coinValue];

    if(baseString.length > 16){
        baseString  = [baseString substringWithRange:NSMakeRange(0, 16)];
    }

    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:baseString];

    NSFont *font = [NSFont fontWithName:@"LucidaGrande-Bold" size:14.0];
    [string addAttribute:NSFontAttributeName value:font range:NSMakeRange(0,string.length)];
    [string addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,string.length)];

    return string;
}

@end