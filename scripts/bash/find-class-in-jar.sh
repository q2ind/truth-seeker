#!/bin/bash
# find-class-in-jar <directory> <search_string>
# 
if [ $# -ne 2 ]; then
    echo "Usage: $0 <jar_directory> <search_string>"
    exit 1
fi

find "$1" -name "*.jar" -exec sh -c 'jar -tf {} | grep -H --label {} '$2'' \;
