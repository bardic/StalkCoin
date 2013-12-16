//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBMtGoxService.h"
#import "OBDefines.h"


@implementation OBMtGoxService {
    NSMutableDictionary *endPointDict;
}

- (id)init {
    self = [super init];
    if (self) {
        endPointDict = [NSMutableDictionary new];
        [endPointDict insertValue:@"http://data.mtgox.com/api/1/BTCUSD/ticker_fast" inPropertyWithKey:BTC];
    }

    return self;
}


-(void)getPriceForCoin:(NSString *)coin{

}

@end