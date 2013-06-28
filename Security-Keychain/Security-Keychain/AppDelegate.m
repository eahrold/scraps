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
    BOOL rc = NO;
    rc = [SSKeychain setPassword:self.passwd.stringValue forService:self.kcitem.stringValue account:self.user.stringValue];
    if (rc){
        NSLog(@"Keychain Created Successfully");
    }
}


- (IBAction)getPressed:(id)sender{
    NSLog(@"Get Pressed for %@",self.user.stringValue);
    NSString *rc = [SSKeychain passwordForService:self.kcitem.stringValue account:self.user.stringValue];
    NSLog(@"the password is: %@",rc);

}
@end
