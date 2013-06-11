#!/usr/bin/env python

import subprocess

server = "my.server.com"

p1 = subprocess.Popen(['odutil', 'show','nodenames'], stdout=subprocess.PIPE)
p2 = subprocess.Popen(['grep','-E','/%s.*Online' % server], stdin=p1.stdout,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
p1.stdout.close()
output = p2.communicate()[0]

print "this is out " + output

if output:
    print "good"
else:
    print "bad"