#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Check VPN Status
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./hotspot-shield-logo.png

# Documentation:
# @raycast.author Andrew Suh

-- Check if Hotspot Shield is running and if VPN is connected
tell application "System Events"
    set isRunning to (exists process "Hotspot Shield")
    set isConnected to (exists menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2 of process "Hotspot Shield")
end tell

if not isRunning or not isConnected then
    do shell script "echo 'VPN not connected'"
	return 0
else
	do shell script "echo 'VPN connected'"
	return 1
end if
