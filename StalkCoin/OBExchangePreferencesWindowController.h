/*
 * StalkCoin v 0.2
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42+1):
 * <bardic.knowledge@gmail.com> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return or contribute to my beer fund
 * via Bitcoin and/or Litecoin:
 *
 * Bitcoin: 1GWGoT9r6wAgdERT7QogehPvaaUUEohcEQ
 * Litecoin: LVFwvucM5mTdFKxfgfQbMEqaC7rE3tncEM
 * ----------------------------------------------------------------------------
 */

#import <Cocoa/Cocoa.h>
#import "OBExchangePrefDelegate.h"

@interface OBExchangePreferencesWindowController : NSWindowController<NSWindowDelegate>{
    IBOutlet NSButton *btce_ltc;
    IBOutlet NSButton *btce_btc;
    IBOutlet NSButton *btce_ftc;

    IBOutlet NSButton *mtgox_btc;

    //IBOutlet NSButton *cryptsy_btc;
    IBOutlet NSButton *cryptsy_ltc;
    IBOutlet NSButton *cryptsy_qrk;

    IBOutlet NSButton *bitfinex_btc;
    IBOutlet NSButton *bitfinex_ltc;

    IBOutlet NSButton *coinbase_btc;

    NSMutableArray *buttonArray;
}

@property (weak) id<OBExchangePrefDelegate> delegate;

-(IBAction)onSave:(id)sender;
-(IBAction)onReset:(id)sender;
-(void)showExchangeWindow;

@end
