//
//  OBExchangePreferencesWindowController.h
//  StalkCoin
//
//  Created by Thomas Gillis on 12/13/2013.
//  Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OBExchangePreferencesWindowController : NSWindowController<NSWindowDelegate>{
    IBOutlet NSButton *btce_ltc;
    IBOutlet NSButton *btce_btc;

    IBOutlet NSButton *mtgox_btc;

    IBOutlet NSButton *cryptsy_btc;
    IBOutlet NSButton *cryptsy_ltc;
    IBOutlet NSButton *cryptsy_qrk;

    IBOutlet NSButton *bitfinex_btc;
    IBOutlet NSButton *bitfinex_ltc;
}

-(IBAction)onSave:(id)sender;
-(void)showExchangeWindow;
@end
