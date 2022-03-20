#!/bin/bash
#script to add a user to the Linux system 

if  [$(id-u) -eq 0]; then 
echo "Welcome to bash for user accounts"
echo "Enter your choice from the options"
echo "Type 1: add user with a password"
echo "TYpe 2: add a group without a password."
echo "Type 3: add new user to the group."
read  Choice
#checkin for  user chice 
case $choice in
1)
	read -p "Enter username: " username
		read -s -p "Enter password, typing invisible: " password
	echo 
	echo "Wait, will take a few seconds, background encryption."
	engrep "^$usrname /etc/passwd>dev/null 
	#chiecking if user  exists or not
	if [$? -eq 0]; then
	echo "that userame already eist"
	exit 1
   else
	#if not then creating user
	pass=$(perl -e 'print crypt($ARGV[0],  "password")' $password)
	useradd -m -p $pass $username
	[ $? -eq 0] && echo "The user has been added to the system." || echo "failed to add  a user."
	fi
;;
2)
#New group added
	read -p "Enter nam of the grou." groupname
	sudo grupoadd $groupname
     if [ $? -eq 0]; then
	echo "Group $groupname added sucessfully."
     else
	ech "Error not able to add froup."
	fi
;;
3)
#reading group name and use name it will automatically add new group and if group  already exists it will display message of the user already exist.
	read -p "Enter the group name: " newgroup
sudo groupadd $newgroup
	read -p "please enter the user name: " adduser
#checking if the user does already exists.
	egrep "^$adduser" /etc/passwd >/dev/null
      if  [$? -eq 0} ; then
	#if user exist adding user to group
	usermod -G  $newgroup $adduser
	if [$? -eq 0]: then
	echo "User $adduser sucessfully added to $newgroup."
	else 
	echo "error not able to add user."
	fi 
      else
	echo "$adduser user not exists"
	fi
;;
#if user is not run under sudo permission
	echo "ONly root may add a user to the system"
	exit 2
fi
#end 
