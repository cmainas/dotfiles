#!/bin/bash

service=$1
machine=$2
port=$3

if [ $# -eq 0 ]; then
	echo "No argunments"
	exit 1
fi

if [ -z "$port" ]; then
	port=22
fi

if [ "$service" == "ssh" ]; then
	if [ "$machine" == "multi" ]; then
		echo "ssh -i ~/ssh_multi/id_rsa -p $port xaralampos@192.168.1.17"
		ssh -i ~/ssh_multi/id_rsa -p $port xaralampos@192.168.1.17
		exit 0
	elif [ "$machine" == "mauros" ]; then
		echo "ssh -p $port santinux@192.168.1.11"
		ssh -p $port santinux@192.168.1.11
		exit 0
	elif [ "$machine" == "orion" ]; then
		echo "ssh oslabc13@orion.cslab.ece.ntua.gr"
		ssh oslabc13@orion.cslab.ece.ntua.gr
		exit 0
	else
		echo "Wrong argunments"
		exit 1
	fi
elif [ "$service" == "sftp" ]; then
	if [ "$machine" == "multi" ]; then
		echo "sftp -i ~/ssh_multi/id_rsa -P $port xaralampos@192.168.1.17"
		sftp -i ~/ssh_multi/id_rsa -P $port xaralampos@192.168.1.17
		exit 0
	elif [ "$machine" == "mauros" ]; then
		echo "sftp -P $port santinux@192.168.1.11"
		sftp -P $port santinux@192.168.1.11
		exit 0
	elif [ "$machine" == "orion" ]; then
		echo "ssh oslabc13@orion.cslab.ece.ntua.gr"
		ssh oslabc13@orion.cslab.ece.ntua.gr
		exit 0
	else 
		echo "Wrong argunments"
		exit 1
	fi
else
	echo "Wrong argunments"
	exit 1
fi

	

