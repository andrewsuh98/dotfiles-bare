#!/bin/bash

# Path to your Dropbox folder
DROPBOX_DIR="/Users/andrewsuh/Library/CloudStorage/Dropbox"

# Check if the Dropbox folder exists
if [ -d "$DROPBOX_DIR" ]; then
	# Check if there are any files in the .dropbox.cache directory
	CACHE_FILES=$(find "$DROPBOX_DIR/.dropbox.cache" -type f 2>/dev/null)
	if [ -n "$CACHE_FILES" ]; then
		echo "Dropbox is currently syncing."
	else
		echo "Dropbox is not syncing."
	fi
else
	echo "Error: Dropbox folder not found at $DROPBOX_DIR."
	exit 1
fi
