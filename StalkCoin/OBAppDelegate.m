/*
 * StalkCoin v 0.1
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
#import "CJSONDeserializer.h"
#import "OBCoinVO.h"

@implementation OBAppDelegate{
    int coin_index;
    NSMutableDictionary *urlEndPoints;
    NSArray * coinTypes;
    NSMutableArray *coinArray;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
    _item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [_item setHighlightMode:YES];
    [_item setEnabled:YES];
    [_item setTarget:self];

    [self setup];
    [self parse:[self requestCoinForIndex:@"LTC"]];
    
    NSMenu *statusMenu = [[NSMenu alloc] initWithTitle:@"StalkCoin"];
    NSMenuItem *aboutItem = [[NSMenuItem alloc] initWithTitle:@"About" action:@selector(onAbout:) keyEquivalent:@""];
    NSMenuItem *updateItem = [[NSMenuItem alloc] initWithTitle:@"Force Update" action:@selector(onUpdate) keyEquivalent:@""];
    NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(onQuit) keyEquivalent:@""];
    [statusMenu addItem:aboutItem];
    [statusMenu addItem:updateItem];
    [statusMenu addItem:quitItem];
    [_item setMenu:statusMenu];
}

-(void)setup{
    coin_index = 0;
    coinArray = [[NSMutableArray alloc] init];
    coinTypes = [NSArray arrayWithObjects:@"LTC", @"BTC", nil];
    urlEndPoints = [[NSMutableDictionary alloc]  init];
    [urlEndPoints setObject:@"https://btc-e.com/api/2/ltc_usd/ticker" forKey:@"LTC"];
    [urlEndPoints setObject:@"https://btc-e.com/api/2/btc_usd/ticker" forKey:@"BTC"];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(changeCoin) userInfo:nil repeats:YES]; //Update every 10 seconds
    [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(updateCoin) userInfo:nil repeats:YES]; //Update every 10 seconds

    [self initPrices];
}

- (void)initPrices {
    for(NSString*type in coinTypes){
        [coinArray addObject:[[OBCoinVO alloc] initWithCoinName:type andCoinValue: [self parse:[self requestCoinForIndex:type]]]];
    }

    [self changeCoin];
}

-(NSData *)requestCoinForIndex:(NSString *)type{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[urlEndPoints objectForKey:type]]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    return response;
}

-(NSString *)parse:(NSData *)json{
    NSDictionary* coin_details = [[CJSONDeserializer deserializer] deserialize:json error:nil];
    id ticker = [coin_details objectForKey:@"ticker"];
    id price = [ticker objectForKey:@"buy"];
    return price;
}

-(void)changeCoin{
    NSLog(@"Change Coin");
    [_item setTitle:[(OBCoinVO *)[coinArray objectAtIndex:coin_index] toString]];
    coin_index++;
    if(coin_index >= [coinTypes count]){
        coin_index = 0;
    }

}

-(void)updateCoin{
    NSLog(@"Update Coin");
    for(OBCoinVO *coinVO in coinArray){
        coinVO.coinValue = [self parse:[self requestCoinForIndex:coinVO.coinName]];
    }
}

-(void)onAbout:(id)sender{
    NSLog(@"About Page");
    _panel.delegate = self;
    [NSApp runModalForWindow:_panel];
}

-(void)onUpdate{
    NSLog(@"Force update");
    [self updateCoin];
}

-(void)onQuit{
    NSLog(@"Kill App");
    [[NSApplication sharedApplication] terminate:nil];
}

- (void)windowWillClose:(NSNotification *)notification {
    NSLog(@"Close popup window");
    [NSApp stopModal];

}


@end
