//
//  OBAboutWindowController.m
//  StalkCoin
//
//  Created by Thomas Gillis on 12/13/2013.
//  Copyright (c) 2013 Thomas Gillis. All rights reserved.
//

#import "OBAboutWindowController.h"

@interface OBAboutWindowController ()

@end

@implementation OBAboutWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
        window.delegate = self;
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)showAboutWindow {
    self.window.delegate = self;
    [NSApp runModalForWindow:self.window];
}

- (void)windowWillClose:(NSNotification *)notification {
    [NSApp stopModal];
}

@end
