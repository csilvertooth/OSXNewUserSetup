#!/bin/bash
# This script was written by Christopher Silvertooth - 2/14/2011
# http://musings.silvertooth.us
# I am not responsible for any loss of data or other unknown issues


# This script will change the permissions on the currently logged in users home directory
# Script updated on 3/22/11 - Added allow execute for WebSharing
# Made changes to name and streamlining process for github storage.

username=`/usr/bin/whoami`

# The Java enable scripts are constantly changing.  Below is for legacy and no longer works. Check
# http://derflounder.wordpress.com for the latest on how to enable Java through a script.

#SystemUUID=$(system_profiler SPHardwareDataType | awk -F" " '/UUID/{print $3}')
#/usr/libexec/PlistBuddy -c "Add :GeneralByTask:Any:WebComponentsEnabled bool true" /Users/$username/Library/Preferences/ByHost/com.apple.java.JavaPreferences.$SystemUUID.plist

# The following fixes the permissions on the home folder for each new user created.

echo $username
chmod 700 /Users/$username
chmod +a "_www allow execute,read" /Users/$username
rm /Users/$username/Library/LaunchAgents/OSXNewUserSetup.plist
