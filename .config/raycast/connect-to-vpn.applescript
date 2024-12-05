#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connect to VPN
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon ./hotspot-shield-logo.png

# Documentation:
# @raycast.description Connect to Hotspot Shield VPN on the United States server
# @raycast.author Andrew Suh

-- Check if Hotspot Shield is running
log "Checking if Hotspot Shield is running..."
tell application "System Events"
    set isRunning to (exists process "Hotspot Shield")
end tell

if not isRunning then
    set startHotspotShield to button returned of (display dialog "Hotspot Shield is not running. Would you like to start it?" buttons {"No", "Yes"} default button "Yes")
    if startHotspotShield is "Yes" then
        log "Starting Hotspot Shield..."
        tell application "Hotspot Shield"
            activate
        end tell
    else
        log "Exiting script..."
        return
    end if
end if

-- Check if VPN is already connected
log "Checking if VPN is already connected..."
tell application "System Events"
    set isAlreadyConnected to exists menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2 of process "Hotspot Shield"
end tell

-- If VPN is already connected, write to console
if isAlreadyConnected then
    log "VPN already connected"
else
    -- Now that Hotspot Shield is running and VPN is not connected, let's connect
    log "Connecting to VPN..."
    tell application "System Events"
        tell process "Hotspot Shield"
            -- Click on the menu bar item
            click menu bar item 1 of menu bar 2
            
            -- Delay to ensure menu opens
            delay 0.5
            
            -- Click on "United States" to connect (replace with your location name)
            click menu item "United States" of menu 1 of menu bar item 1 of menu bar 2
        end tell
    end tell
    
    -- Check if VPN is connected after attempting to connect
    tell application "System Events"
        set isConnected to false
        repeat 20 times -- Check 20 times with a delay of 0.5 seconds each
            if exists menu item "Disconnect" of menu 1 of menu bar item 1 of menu bar 2 of process "Hotspot Shield" then
                set isConnected to true
                exit repeat
            end if
            delay 0.5
        end repeat
    end tell
    
    -- Write to console if connected, otherwise exit with error
    if isConnected then
        log "VPN connected"
    else
        log "Failed to connect to VPN"
        error "Failed to connect to VPN"
    end if
end if

