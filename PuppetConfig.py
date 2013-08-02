#!/usr/bin/env python
import subprocess
import os
import plistlib

server_name = 'mdm.masscomm.loyno.edu'
namer_path = '/usr/local/sbin/NameSetDS'
login_window_plist="/Library/Preferences/com.apple.loginwindow HiddenUsersList"

puppet_config_file = '/etc/puppet/puppet.conf'
puppet_launchd_file = '/Library/LaunchDaemons/com.puppetlabs.puppet.plist'


def setComputerName():
    if(os.path.exists(namer_path)):
        p = subprocess.Popen([namer_path], stdout=subprocess.PIPE)
        output = p.communicate()[0]
        
def getCertName():
        p = subprocess.Popen(['scutil', '--get','ComputerName'], stdout=subprocess.PIPE)
        output = p.communicate()[0]
        
        if(output != ""):
            return output
        else:
            raise Exception;
        
def writeConfig():
    puppet_cert_name = getCertName()
    puppet_client_name = puppet_cert_name
    
    lines = [
        "[agent]",
        "logdir = /var/log/puppet",
        "rundir = /var/run/puppet",
        "ssldir = $vardir/ssl",
        "archive_file_server = "+server_name,
        "server = "+ server_name,
        "report = true",
        "pluginsync = true",
        "certname = "+puppet_cert_name,
        "node_name_value = "+puppet_client_name,
        ]        

    f = open(puppet_config_file, "wb")
    for line in lines:
        f.write(line+"\n")
    f.close

def runPuppet():
	pass
	
def writeLaunchD():
	
	pl = dict(
	    Label = "com.puppetlabs.puppet",
	    ServiceDescription = "Puppet Daemon",
	    ServiceIPC = False,
	    RunAtLoad = True,
	    OnDemand = False,
	    EnvironmentVariables = dict(
	        PATH = "/sbin:/usr/sbin:/bin:/usr/bin",
	        RUBYLIB = "/usr/lib/ruby/site_ruby/1.8/",
	    ),
	    ProgramArguments = ['/usr/bin/puppet','agent','--verbose','--no-daemonize','--logdest','console'],
	    StandardErrorPath = "/var/log/puppet/puppet.err",
	    StandardOutPath = "/var/log/puppet/puppet.out",
	)
	plistlib.writePlist(pl, puppet_launchd_file)
	
	## fix the permissions
	subprocess.call(['chmod', '0644', puppet_launchd_file])
	
	## fire it up
	subprocess.call(['/bin/launchctl', 'load','-w', puppet_launchd_file])
	
def hidePuppetUser():
	subprocess.call(['defaults', 'write', login_window_plist, '-array-add' ,'puppet'])
	subprocess.call(['chmod', '0644', login_window_plist])
	
def main():
    setComputerName()
    writeConfig()
    writeLaunchD()
    hidePuppetUser()

if __name__ == "__main__":
    main()
