#!/bin/bash

# Variables
DIR="/path/to/directory"
FILE="filename.txt"

# Check if directory exists
if [ -d "$DIR" ]; then
    echo "Directory exists: $DIR"
else
    echo "Directory does not exist: $DIR"
    echo "Creating directory..."
    mkdir -p "$DIR"
    echo "Directory created: $DIR"
fi

# Check if file exists inside the directory
if [ -f "$DIR/$FILE" ]; then
    echo "File exists: $DIR/$FILE"
else
    echo "File does not exist: $DIR/$FILE"
    echo "Creating file..."
    touch "$DIR/$FILE"
    echo "File created: $DIR/$FILE"
fi
