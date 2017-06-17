#!/bin/bash
source "$1"
base_dir=$(pwd)
tomcat_app_location="/var/lib/tomcat8/webapps"
war_location="$base_dir//loptracker.war"
time_stamp=$(date +%Y-%m-%d-%T)
dir_name="$base_dir/$time_stamp-$file_name"

# This is common function to extract the zip files.

extractLopTrackerZipFile(){
  sudo unzip  "$base_dir"/loptracker.zip -d loptracker/
  if [ "$?" -eq 0 ]
  then
    echo "==>> loptracker.zip extracted successfully"
    return 0
  else
    echo "==>> loptracker.zip extraction failed"
    echo "$?"
  fi
}

# This function is used to extract loptracker.zip
loptrackerExtraction(){
extractLopTrackerZipFile
if [ "$?" -eq 0 ]
then
  echo "==>> loptracker.zip extracted successfully"
else
  echo "==>> loptracker.zip extraction failed"
  echo "$?"
fi
}

# This function is used to deploy the loptracker.war
deployLopTracker(){
sudo service tomcat8 stop && sleep 5
if [ "$?" -eq 0 ]
then
  echo "----- Tomcat shutdown successfull ----"
  sudo rm -r "$tomcat_app_location"/loptracker*
  if [ "$?" -eq 0 ]
  then
    echo "----- Existing war file removed from tomcat/webapps -----"
    sudo cp "$war_location" "$tomcat_app_location"
    if [ "$?" -eq 0 ]
    then
      echo "----- New war file successfully copied to tomcat/webapps -----"
      sudo service tomcat8 start && sleep 5
    else
      echo "----- Copying of war file failed -----"
      echo "$?"
    fi
   else
     echo "----- File deletion failed -----"
     echo "$?"
   fi
else
 echo "----------tomcat stop failed----------"
 echo "$?"
fi
}

# Executing the functions
loptrackerExtraction
if [ "$?" -eq 0 ]
then
  echo " ==>> loptrackerExtraction function successfull"
  deployLopTracker
  if [ "$?" -eq 0 ]
  then
    echo "==> deployLopTracker function successfull"
  else
    echo "==>> executing deployLopTracker function failed"
  fi
else
  echo "==>> executing loptrackerExtraction function failed"
fi
