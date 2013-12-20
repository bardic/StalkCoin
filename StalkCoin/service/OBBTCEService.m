//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

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
        coin.coinValue = price;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end