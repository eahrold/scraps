#!/usr/bin/env python
# encoding: utf-8
"""
Updates existing keychain internet password items with a new password.
Usage: keychain-internet-password-update.py account_name new_password

Contributed by Matt Rosenberg
"""

import ctypes
import sys


# Load Security.framework
Security = ctypes.cdll.LoadLibrary('/System/Library/Frameworks/Security.framework/Versions/Current/Security')

item            = ctypes.c_char_p()
password_length = ctypes.c_uint32(0)
password_data   = ctypes.c_char_p(256)

def addGenericPassword(account_name, new_password, service_name):
    # Call function to add keychain item
    rc = Security.SecKeychainAddGenericPassword(
                                                None,
                                                len(service_name),
                                                str(service_name),
                                                len(account_name),
                                                str(account_name),
                                                len(new_password),
                                                str(new_password),
                                                None,
                                                  )
    
    if rc == -25299:
        updateGenericPassword(account_name, new_password, service_name)
#        raise KeyError('Keychain item %s, for user %s already exists' % (service_name, account_name))
    
    if rc != 0:
        raise RuntimeError('Unable to Add New Keychain item for %s, and account name %s: rc=%d' % (service_name, account_name, rc))

    print('Added Keychain item for %s' % item)


# Start execution

def getGenericPassword(account_name, service_name):
    # the IB object strings need to be converted so we str()
    rc = Security.SecKeychainFindGenericPassword (
                                                  None,
                                                  len(service_name),                  # Length of service name
                                                  str(service_name),                       # Service name
                                                  len(account_name),                  # Account name length
                                                  str(account_name),                       # Account name
                                                  ctypes.byref(password_length),      # Will be filled with pw length
                                                  ctypes.pointer(password_data),      # Will be filled with pw data
                                                  ctypes.pointer(item)
                                                  )
    
    if rc == -25300:
        raise KeyError('No keychain entry for generic password: service=%s, account=%s' % (service_name, account_name))
    elif rc != 0:
        raise RuntimeError('Unable to retrieve generic password (service=%s, account=%s): rc=%d item=%s' % (service_name, account_name, rc, item))

    password = password_data.value[0:password_length.value]
    return password

def updateGenericPassword(account_name, new_password, service_name):
   
    # get the pointer of the keychain item
    rc = Security.SecKeychainFindGenericPassword(
                                                 None,
                                                 len(service_name),
                                                 str(service_name),
                                                 len(account_name),
                                                 str(account_name),
                                                 None,
                                                 None,
                                                 ctypes.pointer(item)
                                                 )
    
    if rc != 0:
        raise Exception('Did not find existing password for server %s, account name %s: rc=%d' % (service_name, account_name, rc))
    
    # so we can then update password
    rc = Security.SecKeychainItemModifyAttributesAndData(
                                                         item,
                                                         None,
                                                         len(new_password),
                                                         str(new_password)
                                                         )
    
    if rc != 0:
        raise RuntimeError('Failed to record new password for server %s, account name %s: rc=%d item=%s' % (service_name, account_name, rc, item))
    
    return 0

def deleteGenericPassword(account_name, service_name):

    rc = Security.SecKeychainFindGenericPassword(
                                                 None,
                                                 len(service_name),
                                                 str(service_name),
                                                 len(account_name),
                                                 str(account_name),
                                                 None, # ctypes.byref(password_length),
                                                 None, # ctypes.pointer(password_pointer),
                                                 ctypes.pointer(item)
                                                 )

    if rc != 0:
        raise RuntimeError('SecKeychainFindGenericPassword failed: rc=%d' % rc)

    print('Deleting Keychain item %s' % item)
    rc = Security.SecKeychainItemDelete(item)

    if rc != 0:
        raise RuntimeError('SecKeychainItemDelete failed: rc=%d' % rc)

