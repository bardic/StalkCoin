//
// Created by Thomas Gillis on 12/14/2013.
// Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OBModel;
@class OBCoinVO;


@interface OBModel : NSObject{
    NSMutableArray *coins;
}

@property (nonatomic, strong) NSMutableArray *coins;
+(OBModel *)sharedSingleton;
-(void)saveCoin:(OBCoinVO *)coin;
@end