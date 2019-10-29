#!/usr/bin/env bash

echo "load gitrepo.sh"

#my gitbash
[ -f ${HOME}/.gitbash/mygit.rc ] && source ${HOME}/.gitbash/mygit.rc

# Gitflow
alias flow='git-flow'

# alias newrepo='ssh git@s3.dehengxu.com bash gitremoterepo.sh create'
# alias delrepo='ssh git@s3.dehengxu.com bash gitremoterepo.sh delete'
# alias mvrepo='ssh git@s3.dehengxu.com bash gitremoterepo.sh move'
# alias lsrepo='ssh git@s3.dehengxu.com ls'

repo_host="your_domain"
repo_user="your_host_user_name"
repo_remote_path="."
repo_home="repos"

function newrepo() {
    ssh $repo_user@$repo_host bash $repo_home/git_repo_remote.sh create $repo_home/$1
}

function delrepo() {
    ssh $repo_user@$repo_host bash $repo_home/git_repo_remote.sh delete $repo_home/$1
}

function mvrepo() {
    ssh $repo_user@$repo_host bash $repo_home/git_repo_remote.sh move $repo_home/$1 $repo_home/$2
}

function lsrepo() {
    ssh $repo_user@$repo_host ls $repo_home/$1
}