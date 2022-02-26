#!/bin/bash

# Script to delete all node_modules and .next in a given directory

declare -a DIRS=('node_modules' '.next')

for dir in "${DIRS[@]}"; do
  echo "Looking for '$dir' folders to clear:"
  res=$(find . -name $dir -type d -prune)

  if [ "$res" = "" ]; then
    echo -e "\033[0;32mNo '$dir' directories have been found!\033[0m "
    # exit 1
    continue
  else
    echo "$res"
  fi

  echo -e -n "\033[0;33mType [yes/no] to proceed(only those will be accpeted)?\033[0m "

  read confirmation

  if [ "$confirmation" = "yes" ]; then
    echo -e "\033[0;36mWorking on it..."
    find . -name $dir -type d -prune -exec rm -rf '{}' +
    echo -e "\033[0;32mYou just cleared all $dir, Congrats!"
  elif [ "$confirmation" = "no" ]; then
    echo -e "\033[1;34mNo folders got deleted\033[0m"
  else
    echo -e "\033[1;34mUnsupported Answer, Operation Abandoned!\033[0m"
  fi
done
