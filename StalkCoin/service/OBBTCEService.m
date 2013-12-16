//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBBTCEService.h"
#import "CJSONDeserializer.h"
#import "OBCoinVO.h"
#import "OBDefines.h"


@implementation OBBTCEService {
    NSMutableDictionary *endPointDict;
}


- (id)init {
    self = [super init];
    if (self) {
        endPointDict = [NSMutableDictionary new];
        [endPointDict insertValue:@"https://btc-e.com/api/2/ltc_usd/ticker" inPropertyWithKey:LTC];
        [endPointDict insertValue:@"https://btc-e.com/api/2/btc_usd/ticker" inPropertyWithKey:BTC];
    }

    return self;
}

-(void)getPriceForCoin:(NSString *)coin{
    ///for(OBCoinVO *vo in coins){
        //TODO: Stuff into model
        NSString *tickerString = [self parse:[self requestCoinForIndex:coin]];
    //}
}

-(NSData *)requestCoinForIndex:(NSString *)type{
    //TODO Change all this to use AFNetworking
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[endPointDict objectForKey:type]]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return response;
}

-(NSString *)parse:(NSData *)json{
    NSDictionary* coin_details = [[CJSONDeserializer deserializer] deserialize:json error:nil];
    id ticker = [coin_details objectForKey:@"ticker"];
    id price = [ticker objectForKey:@"buy"];
    return price;
}
@end