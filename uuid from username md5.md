in python

	import hashlib
	import re
	username=""
	
	m = hashlib.md5()
	m.update(username)
	print re.sub(r'[a-zAND0]',r'',m.hexdigest())[-5:]


and in bash

	username=""
    "md5 -s ${username} |sed -e 's/0//g' -e 's/[a-z]//g' -e 's/\\ //g'| tail -c 6"