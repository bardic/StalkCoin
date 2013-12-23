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

#import "OBAppDelegate.h"
#import "OBCoinVO.h"
#import "CJSONDeserializer.h"
#import "OBAboutWindowController.h"
#import "OBExchangePreferencesWindowController.h"
#import "OBAPIService.h"
#import "OBModel.h"

@implementation OBAppDelegate{
    NSUInteger coin_index;

    NSMutableArray *coinArray;
    OBAPIService *service;

    NSTimer * changeCoinTimer;
    NSTimer * updateCoinTimer;

    bool resetPrefs;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    _item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_item setHighlightMode:YES];
    [_item setEnabled:YES];
    [_item setTarget:self];

    coinArray = [[NSMutableArray alloc] init];
    service = [[OBAPIService alloc] init];

    resetPrefs = NO;

    [self setup];
    [self createMenu];
}

- (void)createMenu {
    NSMenu *statusMenu = [[NSMenu alloc] initWithTitle:@"StalkCoin"];
    NSMenuItem *aboutItem = [[NSMenuItem alloc] initWithTitle:@"About" action:@selector(onAbout:) keyEquivalent:@""];
    NSMenuItem *settingsItem = [[NSMenuItem alloc] initWithTitle:@"Settings" action:@selector(onSettings:) keyEquivalent:@""];
    //NSMenuItem *updateItem = [[NSMenuItem alloc] initWithTitle:@"Force Update" action:@selector(onUpdate) keyEquivalent:@""];
    NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(onQuit) keyEquivalent:@""];
    //[statusMenu addItem:updateItem];
    [statusMenu addItem:aboutItem];
    [statusMenu addItem:settingsItem];
    [statusMenu addItem:quitItem];
    [_item setMenu:statusMenu];
    [_item setTitle:@"Loading..."];
}

-(void)setup{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if(![prefs objectForKey:@"created"] || resetPrefs){
        [prefs setBool:YES forKey:@"created"];
        [prefs setBool:YES forKey:@"BTCE_BTC"];
        [prefs setBool:YES forKey:@"BTCE_LTC"];
        [prefs setBool:YES forKey:@"BTCE_FTC"];
        [prefs setBool:NO forKey:@"MTGOX_BTC"];
        [prefs setBool:NO forKey:@"CRYPTSY_BTC"];
        [prefs setBool:NO forKey:@"CRYPTSY_LTC"];
        [prefs setBool:NO forKey:@"CRYPTSY_QRK"];
        [prefs setBool:NO forKey:@"BITFINEX_BTC"];
        [prefs setBool:NO forKey:@"BITFINEX_LTC"];
        [prefs setBool:NO forKey:@"COINBASE_BTC"];
    }

    if([prefs boolForKey:@"BTCE_BTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:BTC andExchange:BTCE andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"BTCE_LTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:LTC andExchange:BTCE andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"BTCE_FTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:FTC andExchange:BTCE andCoinValue:@"" andCurrency:@"BTC" ]];
    }

    if([prefs boolForKey:@"MTGOX_BTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:BTC andExchange:MTGOX andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"CRYPTSY_BTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:BTC andExchange:CRYPTSY andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"CRYPTSY_LTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:LTC andExchange:CRYPTSY andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"CRYPTSY_QRK"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:QRK andExchange:CRYPTSY andCoinValue:@"" andCurrency:@"BTC" ]];
    }


    if([prefs boolForKey:@"BITFINEX_BTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:BTC andExchange:BITFINEX andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"BITFINEX_LTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:LTC andExchange:BITFINEX andCoinValue:@"" andCurrency:@"USD" ]];
    }

    if([prefs boolForKey:@"COINBASE_BTC"]){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:BTC andExchange:COINBASE andCoinValue:@"" andCurrency:@"USD" ]];
    }


    [OBModel sharedSingleton].coins = coinArray;

    if(!changeCoinTimer)
        changeCoinTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeCoin) userInfo:nil repeats:YES]; //Update every 5 seconds

    if(!updateCoinTimer)
        updateCoinTimer = [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(updateCoinPrices) userInfo:nil repeats:YES]; //Update every 60 seconds

    [self updateCoinPrices];
}

-(void)updateCoinPrices{
    //TODO Figure out best way to store settings and how to retrieve
    NSLog(@"Coin Arr Len: %i", (int)[coinArray count]);
    for(OBCoinVO *coin in coinArray){
        [service getPriceForCoin:coin];
    }
}

-(void)changeCoin{
    OBCoinVO *coin = (OBCoinVO *)[[OBModel sharedSingleton].coins objectAtIndex:coin_index];
    [_item setTitle:[coin toString]];
    coin_index++;
    if(coin_index >= [[OBModel sharedSingleton].coins count]){
        coin_index = 0;
    }
}

-(void)onAbout:(id)sender{
    OBAboutWindowController *aboutWindowController = [[OBAboutWindowController alloc] initWithWindowNibName:@"AboutView"];
    [aboutWindowController showAboutWindow];
}

-(void)onSettings:(id)sender{
    OBExchangePreferencesWindowController *exchangePreferencesWindowController= [[OBExchangePreferencesWindowController alloc] initWithWindowNibName:@"ExchangePreferencesView"];
    exchangePreferencesWindowController.delegate = self;
    [exchangePreferencesWindowController showExchangeWindow];
}

- (void)preferencesSaved {
    [self setup];
}

-(void)onQuit{
    [[NSApplication sharedApplication] terminate:nil];
}

@end
