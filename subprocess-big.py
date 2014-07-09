import subprocess

private_key_file='/Volumes/myHome/Users/eldon/Desktop/dsa_priv.pem'
app_zip='/Applications/Printer-Installer.zip'

p1 = subprocess.Popen(['openssl','dgst', '-sha1','-binary',app_zip], stdout=subprocess.PIPE)
if p1.wait() != 0:
    print "error on 1"
    
p2 = subprocess.Popen(['openssl', 'dgst', '-dss1' ,'-sign', private_key_file],stdin=p1.stdout,stdout=subprocess.PIPE)
if p2.wait() != 0:
    print "error on 2" 
  
p3 = subprocess.Popen(['openssl', 'enc', '-base64'],stdin=p2.stdout,stdout=subprocess.PIPE)

# p1.stdout.close()
# p2.stdout.close()
output = p3.communicate()[0]
