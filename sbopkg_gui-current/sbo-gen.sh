#!/bin/bash

# Determine the directory of the script
SCRIPT_DIR=/var/lib/sbopkg/SBo-git
cd "$SCRIPT_DIR" || exit

# @bassmadrigal's script https://www.linuxquestions.org/questions/slackware-14/script-for-building-a-slackbuilds-txt-4175598436/#post5661600
# modified  by rizitis 8/2023 for sbopkg_gui needs , working  for ponce repo. 
#

# Redirecting output to append to the file
exec > "$SCRIPT_DIR/SLACKBUILDS.TXT"


echo "$(date "+%d/%m/%Y-%T")"
echo
echo

for i in */*; do
  NAME=$(echo $i | cut -d "/" -f2)
  FILES=$(ls $i)
  source $i/${NAME}.info
  SHORTDES=$(grep -m 1 $NAME $i/slack-desc | cut -d " " -f2-)
  echo SLACKBUILD NAME: $NAME 
  echo SLACKBUILD LOCATION: $i
  echo SLACKBUILD FILES: $FILES
  echo SLACKBUILD VERSION: $VERSION
  echo SLACKBUILD DOWNLOAD: $DOWNLOAD
  echo SLACKBUILD DOWNLOAD_x86_64: $DOWNLOAD_x86_64 
  echo SLACKBUILD MD5SUM: $MD5SUM 
  echo SLACKBUILD MD5SUM_x86_64: $MD5SUM_x86_64 
  echo SLACKBUILD REQUIRES: $REQUIRES 
  echo SLACKBUILD SHORT DESCRIPTION: $SHORTDES 
  echo 
done
