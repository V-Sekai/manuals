#!/bin/bash

# Get the current date in ISO format
DATE=$(date "+%Y%m%d")

# Get the script's directory
DIR=$(dirname "$0")

# Define the source file path
SRC="$DIR/present-proposal-template.md"

# Check if an argument was provided
if [ -z "$1" ]
then
  # Replace 'present-proposal-template' with the date string in the filename
  DEST="${SRC/present-proposal-template/$DATE}"
else
  # Replace 'present-proposal-template' with the date string and argument in the filename
  DEST="${SRC/present-proposal-template/$DATE-$1}"
fi

# Copy the source file to the new destination
cp $SRC $DEST
