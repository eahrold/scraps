#-*- coding: utf-8 -*-
#
#  Security_KeychainAppDelegate.py
#  Security-Keychain
#
#  Created by Eldon Ahrold on 6/11/13.
#  Copyright aapps 2013. All rights reserved.
#

from Foundation import *
from AppKit import *
import objc
import getpass

import AppKeychain

BUNDLE_ID = NSBundle.mainBundle().bundleIdentifier()

#BUNDLE_ID='PyObj-C Keychain Example'

class AppDelegate(NSObject):
    user = objc.IBOutlet()
    site = objc.IBOutlet()
    passwd = objc.IBOutlet()
    

    create = objc.IBOutlet()
    delete = objc.IBOutlet()
    find = objc.IBOutlet()

    def applicationShouldTerminateAfterLastWindowClosed_(self, sender):
        return YES
    
    def applicationDidFinishLaunching_(self, sender):
        self.user.setStringValue_(getpass.getuser())
        self.site.setStringValue_(BUNDLE_ID)
        self.passwd.setStringValue_("mypass")
    
    @objc.IBAction
    def addKeychainItem_(self,sender):
        user=self.user.stringValue()
        site=self.site.stringValue()
        passwd=self.passwd.stringValue()

        AppKeychain.addGenericPassword(user,passwd)
        

    @objc.IBAction
    def findKeychainItem_(self,sender):
        user=self.user.stringValue()
        site=self.site.stringValue()
        passwd=self.passwd.stringValue()
        
        psswd=AppKeychain.getGenericPassword(user)
        print psswd
    @objc.IBAction

    def deleteKeychainItem_(self,sender):
        user=self.user.stringValue()
        site=self.site.stringValue()
        passwd=self.passwd.stringValue()
        
        AppKeychain.deleteGenericPassword(user)


    