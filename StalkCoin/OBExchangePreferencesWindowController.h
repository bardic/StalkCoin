//
//  OBExchangePreferencesWindowController.h
//  StalkCoin
//
//  Created by Thomas Gillis on 12/13/2013.
//  Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OBExchangePrefDelegate.h"

@interface OBExchangePreferencesWindowController : NSWindowController<NSWindowDelegate>{
    IBOutlet NSButton *btce_ltc;
    IBOutlet NSButton *btce_btc;

    IBOutlet NSButton *mtgox_btc;

    //IBOutlet NSButton *cryptsy_btc;
    IBOutlet NSButton *cryptsy_ltc;
    IBOutlet NSButton *cryptsy_qrk;

    IBOutlet NSButton *bitfinex_btc;
    IBOutlet NSButton *bitfinex_ltc;

    NSMutableArray *buttonArray;
}

@property (weak) id<OBExchangePrefDelegate> delegate;

-(IBAction)onSave:(id)sender;
-(IBAction)onReset:(id)sender;
-(void)showExchangeWindow;

@end
