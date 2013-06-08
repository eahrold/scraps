Simple OpenFile Dialog in PyObjc

Surprisingly it took me quite a while to figure out how to to this, once again turned out to be pretty simple.
Here we go, first thing make sure Cocoa is imported

from Cocoa import * 

second, define a method like this:

def openFile():
        panel = NSOpenPanel.openPanel()
        panel.setCanCreateDirectories_(True)
        panel.setCanChooseDirectories_(True)
        panel.setCanChooseFiles_(True)
        #… there are lots of options, you see where this is going…
         if panel.runModal() == NSOKButton:
                    return panel.filename()
        return 

now you can call the dialog and store it’s return value like this:

file = openFile()

if you want to choose a directory instead of a file just use:

return panel.directory()

instead of 

return panel.filename()

you can also return multiple files or filter for specific extension, I’m sure you’ll figure this out yourself.