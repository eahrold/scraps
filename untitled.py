#!/usr/bin/env python


import re
import os
import plistlib
import subprocess
import FoundationPlist
from Foundation import *
from urllib2 import Request, urlopen, URLError, HTTPError
from xml.parsers import expat
import urllib

def escrowKey(key, username, runtype):
    ##submit this to the server fv_status['recovery_password']
    theurl = pref('ServerURL')+"/checkin/"
    serial = GetMacSerial()
    r = GetMacName()
    mydata=[('serial',serial),('recovery_password',key),('username',username),('macname',macname)]
    mydata=urllib.urlencode(mydata)
    req = Request(theurl, mydata)
    try:
        response = urlopen(req)
    except URLError, e:
        if hasattr(e, 'reason'):
            print 'We failed to reach a server.'
            print 'Reason: ', e.reason
            has_error = True
        #NSApp.terminate_(self)
        elif hasattr(e, 'code'):
            print 'The server couldn\'t fulfill the request'
            print 'Error code: ', e.code
            has_error = True
            #NSApp.terminate_(self)
            if has_error:
                plistData = {}
                plistData['recovery_key']=key
                plistData['username']=username
                
                FoundationPlist.writePlist(plistData, '/usr/local/crypt/recovery_key.plist')
                os.chmod('/usr/local/crypt/recovery_key.plist',0700)
                if runtype=="initial":
                    the_command = "/sbin/reboot"
            reboot = subprocess.Popen(the_command,shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()[0]
    else:
        ##need some code to read in the json response from the server, and if the deta matches, display success message, or failiure message, then reboot. If not, we need to cache it on disk somewhere - maybe pull it out with facter?
        #time to turn on filevault
        #NSLog(u"%s" % fvprefs['ServerURL'])
        ##escrow successful, if the file exists, remove it
        thePlist = '/usr/local/crypt/recovery_key.plist'

        if os.path.exists(thePlist):
            os.remove(thePlist)
        if runtype=="initial":
            the_command = "/sbin/reboot"
            reboot = subprocess.Popen(the_command,shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()[0]
