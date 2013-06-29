//
//  AppDelegate.m
//  Security-Keychain
//
//  Created by Eldon Ahrold on 6/27/13.
//  Copyright (c) 2013 aapps. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
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
//    CFStringRef userNameKey = CFSTR("LastUser");
//    CFStringRef userName;
//    userName = (CFStringRef)CFPreferencesCopyAppValue(userNameKey,
//                                                       kCFPreferencesCurrentApplication);
//    if(userName !=  NULL){
//        CFRelease(userName);
//    }
    NSUserDefaults *getDefaults = [NSUserDefaults standardUserDefaults];
    self.user.stringValue = [getDefaults stringForKey:@"LastUser"];

    
    self.kcitem.stringValue = [[NSBundle mainBundle] bundleIdentifier];
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication{
    
    NSString * userName = self.user.stringValue;
    NSDictionary *nDict = @{
                            @"FirstName":self.user.stringValue,
                            @"kcItem":self.kcitem.stringValue,
                            };

    NSUserDefaults * standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    [standardUserDefaults setObject:userName forKey:@"LastUser"];
    [standardUserDefaults setObject:nDict forKey:userName];
    [standardUserDefaults synchronize];

    
    
//    CFStringRef lastUser = CFSTR("LastUser");
//    CFStringRef userName = (CFStringRef)self.user.stringValue;
//    
//    
//    NSDictionary *nDict = @{
//                             @"FirstName":self.user.stringValue,
//                             @"kcItem":self.kcitem.stringValue,
//                             };
//    
//    CFDictionaryRef* cDict=(CFDictionaryRef*)nDict;
//    
//    // Set up the preference.
//    CFPreferencesSetAppValue(lastUser, userName,
//                             kCFPreferencesCurrentApplication);
//    
//    CFPreferencesSetAppValue(userName, cDict,
//                             kCFPreferencesCurrentApplication);
//    
//    // Write out the preference data.
//    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
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
    self.passwd.stringValue = rc;

}
@end
