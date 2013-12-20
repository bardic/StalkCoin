//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OBCoinVO.h"


@interface OBAPIService : NSObject
-(void)getPriceForCoin:(OBCoinVO *)coin;
@end