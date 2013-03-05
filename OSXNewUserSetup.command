#!/bin/bash
# Script Created by Christopher Silvertooth.
# http://musings.silvertooth.us

# Set current working directory
workingDirectory="`dirname \"$0\"`"
scriptName="`basename \"$0\"`"

# This will run the script as root.

RunAsRoot()
{
    if [ ! $( id -u ) -eq 0 ]; then
        echo
        echo "*This application must be run as root. Re-running with admin privileges.*"
        exec sudo su root -c "bash \"$workingDirectory/$scriptName\"" # Call this prog as root
        exit ${?}  # since we're 'execing' above, we wont reach this exit
        # unless something goes wrong.
    fi

}

RunAsRoot


# Create necessary directories and any intermediate directories

mkdir -p /usr/local/bin
mkdir "/System/Library/User Template/English.lproj/Library/LaunchAgents"

# Set correct permissions and owner for newly created folders

chmod 755 /usr/local
chmod 755 /usr/local/bin
chown -R root:wheel /usr/local/bin
chmod -R 700 "/System/Library/User Template/English.lproj/Library/LaunchAgents"
chown -R root:wheel "/System/Library/User Template/English.lproj/Library/LaunchAgents"

# Fix any previous user folders on the system.

find /Users/* -type d -maxdepth 0 -type d \( ! -name Shared \) -exec chmod 700 {} \;
find /Users/* -type d -maxdepth 0 -not \( -type d -name "Shared" -prune \) -exec chmod +a "_www allow execute,read" {} \;

# Copy scripts into default user template so that any new users created will receive the script.

cp "$workingDirectory/OSXNewUserSetup.plist" "/System/Library/User Template/English.lproj/Library/LaunchAgents"
cp "$workingDirectory/OSXNewUserScript.sh" "/usr/local/bin"
