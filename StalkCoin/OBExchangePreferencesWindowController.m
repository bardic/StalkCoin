//
//  OBExchangePreferencesWindowController.m
//  StalkCoin
//
//  Created by Thomas Gillis on 12/13/2013.
//  Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBExchangePreferencesWindowController.h"

@interface OBExchangePreferencesWindowController ()

@end

@implementation OBExchangePreferencesWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        window.delegate = self;
    }
    return self;
}

-(void)awakeFromNib {
    buttonArray = [NSMutableArray new];
    [buttonArray addObject:btce_btc];
    [buttonArray addObject:btce_ltc];
    [buttonArray addObject:mtgox_btc];
    //[buttonArray addObject:cryptsy_btc];
    [buttonArray addObject:cryptsy_ltc];
    [buttonArray addObject:cryptsy_qrk];
    [buttonArray addObject:bitfinex_btc];
    [buttonArray addObject:bitfinex_ltc];
    [buttonArray addObject:coinbase_btc];
    [self setCheckBoxes];
}

- (void)setCheckBoxes {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    btce_ltc.state = [prefs boolForKey:@"BTCE_LTC"];
    btce_btc.state = [prefs boolForKey:@"BTCE_BTC"];
    mtgox_btc.state = [prefs boolForKey:@"MTGOX_BTC"];
    //cryptsy_btc.state = [prefs boolForKey:@"CRYPTSY_BTC"];
    cryptsy_ltc.state = [prefs boolForKey:@"CRYPTSY_LTC"];
    cryptsy_qrk.state = [prefs boolForKey:@"CRYPTSY_QRK"];
    bitfinex_btc.state = [prefs boolForKey:@"BITFINEX_BTC"];
    bitfinex_ltc.state = [prefs boolForKey:@"BITFINEX_LTC"];
    coinbase_btc.state = [prefs boolForKey:@"COINBASE_BTC"];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)onReset:(id)sender {
    btce_btc.state = 0;
    btce_ltc.state = 0;
    mtgox_btc.state = 0;
    //cryptsy_btc.state = 0;
    cryptsy_ltc.state = 0;
    cryptsy_qrk.state = 0;
    bitfinex_btc.state = 0;
    bitfinex_ltc.state = 0;
    coinbase_btc.state = 0;

    [self onSave:nil];
}

-(void)showExchangeWindow {
    self.window.delegate = self;
    [NSApp runModalForWindow:self.window];
}

- (void)windowWillClose:(NSNotification *)notification {
    [NSApp stopModal];
}

-(IBAction)onSave:(id)sender{
    NSLog(@"Save prefs");
    bool atLeastOneSaved = NO;
    for(int i=0; i < [buttonArray count]; i++){
        if(((NSButton *)[buttonArray objectAtIndex:i]).state){
            atLeastOneSaved = YES;
            break;
        }
    }

    if(atLeastOneSaved){
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

        [prefs setBool:[self intToBool:btce_btc.state] forKey:@"BTCE_BTC"];
        [prefs setBool:[self intToBool:btce_ltc.state] forKey:@"BTCE_LTC"];
        [prefs setBool:[self intToBool:mtgox_btc.state] forKey:@"MTGOX_BTC"];
        //[prefs setBool:[self intToBool:cryptsy_btc.state] forKey:@"CRYPTSY_BTC"];
        [prefs setBool:[self intToBool:cryptsy_ltc.state] forKey:@"CRYPTSY_LTC"];
        [prefs setBool:[self intToBool:cryptsy_qrk.state] forKey:@"CRYPTSY_QRK"];
        [prefs setBool:[self intToBool:bitfinex_btc.state] forKey:@"BITFINEX_BTC"];
        [prefs setBool:[self intToBool:bitfinex_ltc.state] forKey:@"BITFINEX_LTC"];
        [prefs setBool:[self intToBool:coinbase_btc.state] forKey:@"COINBASE_BTC"];

        [self.delegate preferencesSaved];
    }else{
        NSLog(@"You have to save at least one coin");
    }
}

-(bool)intToBool:(NSInteger)integer{
    BOOL b = NO;
    if(integer == 1){
        b= YES;
    }

    return b;
}


@end
