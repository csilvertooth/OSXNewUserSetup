This is the newer version of a package I created called NewUserFixes.  This is a scripted version of that package
for easier modification and a more open/visible code base.

You can get most of the details of what this is for and what it does on my website:

http://musings.silvertooth.us/projects/apple-new-userhome-directory-fixes/

Below is a link to a security document published by Apple that is part of the reason why I created this script.

#http://images.apple.com/support/security/guides/docs/SnowLeopard_Security_Config_v10.16.pdf

How to use

You need all 3 files in the same directory: OSXNewUserSetup.command, OSXNewUserScript.sh, and OSXNewUserSetup.plist.

You should be logged in as a user with admin rights.

Now double click the OSXNewUserSetup.command file.  This will prompt you for your admin password.  Once you have entered
the admin password it will run through the creation of the necessary directories as well as run a few commands to lock 
down any existing directories on your system.  Lastly it will copy the OSXNewUserScript.sh to /usr/local/bin so that it can be used with each new user that is created on the computer.  It will also copy the OSXNewUserSetup.plist to the default user template.
This file is what kicks of the OSXNewUserScript.sh on the first login of a new user.

That is it.

Cheers,

Chris
