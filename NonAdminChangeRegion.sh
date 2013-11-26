#!/bin/sh
####################################################################################################
#
# This is free and unencumbered software released into the public domain.
# 
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
# 
# In jurisdictions that recognise copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
# 
# For more information, please refer to <http://unlicense.org/>
#
####################################################################################################
#
# More information: http://macmule.com/2012/02/29/how-to-enable-non-admins-to-change-dvd-region-code/
#
# GitRepo: https://github.com/macmule/nonadminchangeregion
#
###################################################################################################

OS=`/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion | awk '{print substr($1,1,4)}'`

if [[ "$OS" < "10.5" ]]; then
	echo "Unlocking region code setting using OS $OS..."
	if [[ -f "/Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy" ]]; then
		sudo /Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:class string allow" /etc/authorization
		sudo /Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:comment string “Allows any user to change the DVD region code after it has been set the first time.”" /etc/authorization
		sudo /Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:group string user" /etc/authorization
		sudo /Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:shared bool true" /etc/authorization
	else
		echo "PlistBuddy command not found. The DVD region code cannot be unlocked. Please ensure that PlistBuddy is installed at /Library/Receipts/AdditionalEssentials.pkg/Contents/Resources/PlistBuddy."
	fi
else
	echo "Unlocking region code setting using OS $OS..."
	if [[ -f "/usr/libexec/PlistBuddy" ]]; then
		sudo /usr/libexec/PlistBuddy -c "Set :rights:system.device.dvd.setregion.initial:class allow" /etc/authorization
		sudo /usr/libexec/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:class string allow" /etc/authorization
		sudo /usr/libexec/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:comment string “Allows any user to change the DVD region code after it has been set the first time.”" /etc/authorization
		sudo /usr/libexec/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:group string user" /etc/authorization
		sudo /usr/libexec/PlistBuddy -c "Add :rights:system.device.dvd.setregion.change:shared bool true" /etc/authorization
	else
		echo "PlistBuddy command not found. The DVD region code cannot be unlocked. Please ensure that PlistBuddy is installed at /usr/libexec/PlistBuddy."
	fi
fi
