#!/usr/bin/env python

import hashlib
import re
string="saabidin"

m = hashlib.md5()
m.update(string)
print re.sub(r'[a-zAND0]',r'',m.hexdigest())[-6:]


