
import hashlib
import re
string=""

m = hashlib.md5()
m.update(string)
print re.sub(r'[a-zAND0]',r'',m.hexdigest())[-5:]


in bash

    "md5 -s" & userName & " |sed -e 's/0//g' -e 's/[a-z]//g' -e 's/\\ //g'| tail -c 6"