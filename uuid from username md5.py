#!/usr/bin/env python

import hashlib
import re
string="adalongi"

m = hashlib.md5()
m.update(string)
print re.sub(r'[a-zAND0]',r'',m.hexdigest())[-6:]


'''
10280929 pss
Serna ln
Kali fn
kaserna un
498656 uid


adalongi


'''