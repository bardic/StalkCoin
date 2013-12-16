//
// Created by Thomas Gillis on 12/12/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBAPIService : NSObject

-(void)getPricesForExchange:(int)exchange andCoins:(NSString *)coins;
@end