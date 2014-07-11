
import json
import urllib2


def github_latest_release2(user,repo):
    DEST=str(u'https://api.github.com/repos/%s/%s/releases' % (user,repo))
    data = json.load(urllib2.urlopen(DEST))
    latest_release = data[0].get('assets')[0].get('browser_download_url')
    return latest_release
    
def github_latest_release(user,repo):
    DEST=str(u'https://api.github.com/repos/%s/%s/releases' % (user,repo))
    data = json.load(urllib2.urlopen(DEST))
    try:
    	latest_release = data[0].get('assets')[0].get('browser_download_url')
    except:
    	return None
    return latest_release
    
def github_latest_release3(user,repo):
    DEST=str(u'https://api.github.com/repos/%s/%s/releases' % (user,repo))
    data = json.load(urllib2.urlopen(DEST))
    try:
    	rdata = data[0]['assets'][0]['browser_download_url']
        print "here's rdata %s" % rdata
        assets = rdata['assets']
        print "here's assets %s" %assets
        
        
        # .get('assets')[0].get('browser_download_url')
    except:
    	return None
    return latest_release

print github_latest_release3('eahrold','Printer-Installer')
    
