# Thunderbolt Driver Issue Solution

To all who end up in this thread, as I did. Welcome

Another user in this thread had a solution that worked for me, so I will repeat it with a more detailed explanation.

Credit to "Johnatan" on page 3

The issue is that the new Thunderbolt drivers fail to remove and overwrite the old drivers. The problem can be resolved through the device manager.

Right-click on "Start" (the Windows icon at the corner of your taskbar) and select "Device Manager."

Within the device manager, open the category "System Devices."

Scroll down to Thunderbolt(TM) Controller - (model number here)

\*Right-click on it, select "Uninstall Device," and check the box "Delete the driver software for this device."

Once removed, rerun the Thunderbolt installer or the update through the Dell Command Updater.

\*If you are worried about uninstalling the driver in the device manager, fret not. The driver will reinstall itself on reboot if you have an internet connection.
