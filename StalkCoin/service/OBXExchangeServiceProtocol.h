//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OBCoinVO;

@protocol OBXExchangeServiceProtocol <NSObject>

-(void)getPriceForCoin:(OBCoinVO *)coin;
@end