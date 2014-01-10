//
// Created by Derek Heiser on 1/4/2014.
// Copyright (c) 2013 Thomas Gillis and Derek Heiser. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "OBCoinbaseService.h"
#import "OBDefines.h"
#import "OBCoinVO.h"


@implementation OBCoinbaseService {
    NSMutableDictionary *endPointDict;
}

- (id)init {
    self = [super init];
    if (self) {
        endPointDict = [NSMutableDictionary new];
        [endPointDict setObject:@"https://coinbase.com/api/v1/prices/buy" forKey:BTC];
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
        id subTotal = [responseObject objectForKey:@"subtotal"];
        id amount = [subTotal objectForKey:@"amount"];
        coin.coinValue = amount;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end