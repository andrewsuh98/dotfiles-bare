#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disconnect from VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ./hotspot-shield-logo.png

# Documentation:
# @raycast.description Disconnect from Hotspot Shield VPN connection
# @raycast.author Andrew Suh

-- Check if Hotspot Shield is running and if VPN is connected
tell application "System Events"
    set isRunning to (exists process "Hotspot Shield")
    set isConnected to (exists menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2 of process "Hotspot Shield")
end tell

-- If Hotspot Shield is not running or VPN is already disconnected, write to console
if not isRunning or not isConnected then
    do shell script "echo 'VPN not connected'"
else
	-- Now that Hotspot Shield is running and VPN is connected, let's disconnect
	tell application "System Events"
		tell process "Hotspot Shield"
			-- Click on the menu bar item
			click menu bar item 1 of menu bar 2
			
			-- Delay to ensure menu opens
			delay 0.5
			
			-- Click on "Disconnect"
			click menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2
		end tell
	end tell

	-- Check if VPN is disconnected after attempting to disconnect tell application "System Events"
    tell application "System Events"
        set isDisconnected to false
        repeat 20 times -- Check 20 times with a delay of 0.5 seconds each
            if not (exists menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2 of process "Hotspot Shield") then
                set isDisconnected to true
                exit repeat
            end if
            delay 0.5
        end repeat
    end tell

	-- Write to console if disconnected, otherwise write "failed to disconnect VPN"
	if isDisconnected then
		do shell script "echo 'VPN disconnected'"
	else
		do shell script "echo 'Failed to disconnect VPN'"
		error "Failed to disconnect VPN"
	end if
end if
