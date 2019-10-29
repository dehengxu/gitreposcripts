#!/usr/bin/env bash

type=$1
name=$2
newname=$3

function create() {
	name=$1

	if [[ -z $name ]];then
		echo "Input project name, please!"
		exit 1
	fi

	if [[ ! -d $name.git ]];then
		mkdir -p $name.git
	else
		echo "$name.git exist, please use new one."
		exit 1
	fi

	cd $name.git && git init --bare && cd ..
	echo "$name.git was created, please add \"user@server.com:$name.git\" to your git remotes."
	echo "Example: git remote add server user@server.com:$name.git"
	exit 0
}

function delete() {
	name=$1

	if [[ -z $name ]];then
		echo "Input project name, please!"
		exit 1
	fi

	if [[ ! -d $name.git ]];then
		echo "$name.git is not exist."
		exit 1
	fi
	rm -rf $name.git
	echo "$name.git was deleted."
	exit 0
}

function move() {
	oldname=$1
	newname=$2

	if [[ -z $oldname || -z $newname ]];then
		echo "Input oldname and new name, please!"
		echo "old :" $oldname
		echo "new :" $newname
		exit 1
	fi

	if [[ ! -d $oldname.git ]];then
		echo "$oldname.git does not exist."
		exit 1
	fi

	if [[ -d $newname.git ]];then
		echo "$newname.git already exist, cannot be overwrite."
		exit 1
	fi

	mv $oldname.git $newname.git
	echo "$oldname.git was moved to $newname.git"
	echo "You should update your remote :\"user@server.com:$newname.git\""
	echo "Example: git remote set-url origin user@server.com:$newname.git"
	exit 0

}


if [[ $type == 'create' ]];then
	create $name
elif [[ $type == 'delete' ]]; then
	delete $name
elif [[ $type == 'move' ]]; then
	move $name $newname
else
	echo "Usage:"
	echo "./gitremoterepo.sh create project_name"
	echo "./gitremoterepo.sh delete project_name"
	echo "./gitremoterepo.sh move project_name new_project_name"
fi

