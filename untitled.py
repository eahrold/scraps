#!/usr/bin/env python


class test:
    def try1(self):
		msg="hello world"
		self.try2(msg)	
    
    def try2(self,msg):
        print msg
        
x=test()
x.try1()
