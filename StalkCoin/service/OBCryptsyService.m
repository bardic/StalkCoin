//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBCryptsyService.h"
#import "OBDefines.h"


@implementation OBCryptsyService {
    NSMutableDictionary *endPointDict;
}

- (id)init {
    self = [super init];
    if (self) {
        endPointDict = [NSMutableDictionary new];
        [endPointDict insertValue:@"https://btc-e.com/api/2/ltc_usd/ticker" inPropertyWithKey:LTC];
        [endPointDict insertValue:@"http://pubapi.cryptsy.com/api.php?method=singlemarketdata&marketid=71" inPropertyWithKey:QRK];
    }

    return self;
}


-(void)getPriceForCoin:(NSString *)coin{

}
@end