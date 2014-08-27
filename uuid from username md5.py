#!/usr/bin/env python

import hashlib
import re
string="kaserna"

m = hashlib.md5()
m.update(string)
print re.sub(r'[a-zAND0]',r'',m.hexdigest())[-6:]


'''
10280929
Serna
Kali
kaserna
'''