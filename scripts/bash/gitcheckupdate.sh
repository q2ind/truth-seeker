#!/bin/bash
git remote update 

# magic to check if our copy is the same as the upstream copy 
UPSTREAM=${1:-'@{u}'} 
LOCAL=$(git rev-parse @) 
REMOTE=$(git rev-parse "$UPSTREAM") 
BASE=$(git merge-base @ "$UPSTREAM") 

# if our github copy needs a pull then we'll redo the distro 
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date" 
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull" 
elif [ $REMOTE = $BASE ]; then
    echo "Need to push" 
else
    echo "Diverged" 
fi
