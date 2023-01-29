#!/bin/bash

# Set the source and destination directories
src_dir="/path/to/source/directory"
dst_dir="/path/to/destination/directory"

# Define the option to delete the source directory and its contents after a successful transfer (default no) set to "yes" to remove source
delete_src="no"

# Use rsync to copy the contents of the source directory to the destination directory
rsync -ah --progress --stats $src_dir/ $dst_dir/

# Check if the rsync was successful by checking the exit status
if [ $? -eq 0 ]; then
  echo "The contents of the directory have been successfully copied."
  
  # Check if the delete_src option is set to "yes"
  if [ "$delete_src" == "yes" ]; then
    # Delete the source directory and its contents
    rm -rf $src_dir
    echo "The source directory and its contents have been deleted."
  fi
else
  echo "An error occurred while copying the contents of the directory."
fi
