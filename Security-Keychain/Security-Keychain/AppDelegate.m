//
//  AppDelegate.m
//  Security-Keychain
//
//  Created by Eldon Ahrold on 6/27/13.
//  Copyright (c) 2013 aapps. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreFoundation/CoreFoundation.h>
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
    CFStringRef userNameKey = CFSTR("userName");
    CFStringRef userName;
    
    // Read the preference.
    userName = (CFStringRef)CFPreferencesCopyAppValue(userNameKey,
                                                       kCFPreferencesCurrentApplication);
    // When finished with value, you must release it
    if(userName !=  NULL){
        CFRelease(userName);
    }
    
    self.user.stringValue = (NSString*)userName;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication{
    CFStringRef userName = CFSTR("userName");
    CFStringRef colorBLUE = CFSTR("mine");
    
    CFStringRef levels = CFSTR("levels");
    
    CFDictionaryRef *nDict = @{
                             @"FirstName":@"eldor",
                             @"LastName":@"noodle"
                             };
    
    //CFDictionaryRef* cDict=(CFDictionaryRef*)nDict;
    
    // Set up the preference.
    CFPreferencesSetAppValue(userName, colorBLUE,
                             kCFPreferencesCurrentApplication);
    
    CFPreferencesSetAppValue(levels, nDict,
                             kCFPreferencesCurrentApplication);
    
    // Write out the preference data.
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
    return YES;
}

- (IBAction)setPressed:(id)sender{
    NSLog(@"Set Pressed");
    if ([SSKeychain setPassword:self.passwd.stringValue forService:self.kcitem.stringValue account:self.user.stringValue]){
        NSLog(@"Keychain item created successfully");
    }
    else{
        NSLog(@"There was a problem creating the keychain item");
    }
}


- (IBAction)getPressed:(id)sender{
    NSLog(@"Get Pressed for %@",self.user.stringValue);
    NSString *rc = [SSKeychain passwordForService:self.kcitem.stringValue account:self.user.stringValue];
    NSLog(@"the password is: %@",rc);

}
@end
