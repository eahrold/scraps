#-*- coding: utf-8 -*-
#
#  main.py
#  test
#
#  Created by Eldon Ahrold on 6/10/13.
#  Copyright aapps 2013. All rights reserved.
#

#import modules required by application
import objc
import Foundation
import AppKit

from PyObjCTools import AppHelper

# import modules containing classes required to start application and load MainMenu.nib
import AppDelegate

# pass control to AppKit
AppHelper.runEventLoop()
