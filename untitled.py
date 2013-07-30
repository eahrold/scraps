#!/usr/bin/env python


import re
import os
import plistlib
import subprocess
from Foundation import *
from urllib2 import Request, urlopen, URLError, HTTPError
from xml.parsers import expat
import urllib

def GetMacSerial():
    """Returns the serial number for the Mac
        """
    the_command = "ioreg -c \"IOPlatformExpertDevice\" | awk -F '\"' '/IOPlatformSerialNumber/ {print $4}'"
    serial = subprocess.Popen(the_command,shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()[0]
    serial = re.sub(r'\s', '', serial)
    return serial

def GetMacName():
    theprocess = "scutil --get ComputerName"
    thename = subprocess.Popen(theprocess,shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE).communicate()[0]
    thename = thename.strip()
    return thename

def escrowKey(key, username, runtype):
    ##submit this to the server fv_status['recovery_password']
    theurl = "https://mdm.masscomm.loyno.edu/crypt/checkin/"
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
                    pass
                    
    else:
        #NSLog(u"%s" % fvprefs['ServerURL'])
        ##escrow successful, if the file exists, remove it
        thePlist = '/usr/local/crypt/recovery_key.plist'

        if os.path.exists(thePlist):
            os.remove(thePlist)
        if runtype=="initial":
            pass

fv_status = plistlib.readPlist("/Volumes/myHome/Users/eldon/Desktop/fdesetup_output.plist")
NSLog(u"%s" % fv_status['RecoveryKey'])
username = "eldon"
runtype = "none"
key = fv_status["RecoveryKey"]

escrowKey(key, username, runtype):

