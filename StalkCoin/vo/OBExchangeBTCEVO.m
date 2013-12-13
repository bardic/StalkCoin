//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBExchangeBTCEVO.h"
#import "OBAPIService.h"


@implementation OBExchangeBTCEVO {

}

- (void)getLastPriceForCoin:(NSString *)coin {

}

- (void)update {

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[coinEndPoints objectForKey:LTC]]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}


@end