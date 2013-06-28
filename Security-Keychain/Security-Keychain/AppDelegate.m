//
//  AppDelegate.m
//  Security-Keychain
//
//  Created by Eldon Ahrold on 6/27/13.
//  Copyright (c) 2013 aapps. All rights reserved.
//

#import "AppDelegate.h"
#include "SSKeychain.h"

@interface AppDelegate()
@property (nonatomic, assign) IBOutlet NSTextField* user;
@property (nonatomic, assign) IBOutlet NSTextField* passwd;
@property (nonatomic, assign) IBOutlet NSTextField* kcitem;
@end

@implementation AppDelegate

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication{
    return YES;
}

- (IBAction)setPressed:(id)sender{
    NSLog(@"Set Pressed");
    self.user.stringValue = @"me";
}

- (IBAction)getPressed:(id)sender{
    NSLog(@"Get Pressed");
    NSString *result = self.user.stringValue;
    NSLog(@"Get Pressed %@",result);
}
@end
