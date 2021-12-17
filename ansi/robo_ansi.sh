#!/bin/bash
# author siddhu
# this is to create EC2 instances using shall scripting*(Launch instances)
#Date : 17/12/2021


# validating user
USER=$(id -u)
if [ "$USER" -ne 0 ]; then
  echo -e "\e[1;31m You are not authorised to run this\e[0m"
  exit
fi
# validating of tag name hkh
 if [ -e ${1} ]; then
   echo -e "\e[1;31m please enter a Tag name to Perform operation\e[0m"
   exit
 fi
source common.sh

EC2 ${1}
