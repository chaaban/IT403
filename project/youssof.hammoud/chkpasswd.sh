#!/bin/bash
# Reference: https://github.com/TobjasR/chkpasswd.git

info="this script authenticates a given unix user against the shadow file";
usage="usage: ./chkpasswd.sh <username> [-]\n - :	read password from stdin instead of keyboar instead of keyboard";

enterpasswd(){
	echo "enter password for user $user:";
	read -s passwd;
	echo "please enter the password again:";
	read -s passwd2;
	if [ "$passwd" != "$passwd2" ]; then
		echo -e "\nsorry, that didn't match, try again...\n";
		return 1;
	fi;
	return 0;
}

getpasswd(){
	while : ; do
		enterpasswd;
		[[ $? != 0 ]] || break;
	done;
}

case $# in
	1)
		user=$1;
		getpasswd;
		;;
	2)
		user=$1;
		passwd=$(</dev/stdin);
		;;
	*)
		echo -e $info;
		echo -e $usage;
		exit 1;
		;;
esac

linestr=`sudo getent shadow $user`;
if [ $? -ne 0 ]; then
	echo "cannot find user $user in shadow file";
	exit 1;
fi;

IFS=':' read -r -a linearray <<< "$linestr";
hashstr="${linearray[1]}";
IFS='$' read -r -a hasharray <<< "${hashstr}";

algo="${hasharray[1]}";
salt="${hasharray[2]}";
h4sh="${hasharray[3]}";
p4ss="${hasharray[4]}";

# here we check for yescrypt encryption which is not available in openssl passwd command
if [ "$algo" == "y" ]; then
	tmp="\$$algo\$$salt\$$h4sh\$$p4ss"
	slt="\$$algo\$$salt\$$h4sh\$"
	#echo $tmp
	past=$(perl -e "print crypt('$passwd', '$slt')")
	#echo $past
	# reference: https://unix.stackexchange.com/a/707733/302625
	if [ "$tmp" == "$past" ]; then
		echo "Success. User $user authenticated against shadow using yescrypt.";
		exit 0;
	fi

# here we try to hash the password eg. sha512,md5 etcetera (but yescrypt doesn't work in openssl)
elif [ $(echo $passwd | openssl passwd -stdin -$algo -salt $salt) == "$hashstr" ]; then
	echo "Success. User $user authenticated against shadow.";
	exit 0;
fi
echo -e "\nhashes don't match.\nuser $user wasn't able to authenticate against shadow file\n";
exit 1;