#-*- coding: utf-8 -*-
#
#  Pop-Up Array AppDelegate.py
#  Pop-Up Array Example
#
#  Created by Eldon Ahrold on 6/10/13.
#  Copyright aapps 2013. All rights reserved.
#

from Foundation import *
from AppKit import *

class AppDelegate(NSObject):

    popup = objc.IBOutlet()
    arrayController = objc.IBOutlet()
    presets = [{u'preset':u'None'}]
    
    
    def applicationDidFinishLaunching_(self, sender):
        NSLog("Application did finish launching.")

    @objc.IBAction
    def setup_(self,sender):
        self.presets = [{u'preset':u'None'}]
        
        cmdresult = ['this','that','the other']
        
        for i in cmdresult:
            if i:
                self.presets.append({u'preset':i})
            else:
                pass
                    
        self.arrayController.rearrangeObjects()


    @objc.IBAction
    def checkValue_(self,sender):
       print(self.popup.titleOfSelectedItem())
    