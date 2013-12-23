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

#import "OBBTCEService.h"
#import "CJSONDeserializer.h"
#import "OBCoinVO.h"
#import "OBModel.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"


@implementation OBBTCEService {
    NSMutableDictionary *endPointDict;
    OBCoinVO * coinVO;
}


- (id)init {
    self = [super init];
    if (self) {
        endPointDict = [NSMutableDictionary new];
        [endPointDict setObject:@"https://btc-e.com/api/2/ltc_usd/ticker" forKey:LTC];
        [endPointDict setObject:@"https://btc-e.com/api/2/btc_usd/ticker" forKey:BTC];
        [endPointDict setObject:@"https://btc-e.com/api/2/ftc_btc/ticker" forKey:FTC];
    }

    return self;
}

-(void)getPriceForCoin:(OBCoinVO *)coin{
    //TODO: Stuff into model
    [self requestCoinForIndex:coin];
}

-(void)requestCoinForIndex:(OBCoinVO *)coin{
    //TODO Change all this to use AFNetworking
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[endPointDict objectForKey:coin.coinName] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id ticker = [responseObject objectForKey:@"ticker"];
        id price = [ticker objectForKey:@"buy"];
        coin.coinValue = [NSString stringWithFormat:@"%@",price];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end