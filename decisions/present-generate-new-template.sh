#!/bin/bash

# Get the current date in ISO format
DATE=$(date "+%Y%m%d")

# Get the script's directory
DIR=$(dirname "$0")

# Define the source file path
SRC="$DIR/present-proposal-template.md"

# Replace 'present' with the date string in the filename
DEST="${SRC/present/$DATE}"

# Copy the source file to the new destination
cp $SRC $DEST
