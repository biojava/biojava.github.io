#!/bin/bash

now="$(date +'%Y%m%d')"
echo $now
branchname="master_$now"
echo $branchname

#git checkout -b $branchname master    # create and switch to the release branch
#git push -u origin $branchname        # push the release branch to the remote and track it
#git checkout prepare_conversion       # switch to branch that is before mediawiki conversion

# perform conversion
#../mediawiki_to_git_md/convert.py mediawiki_dump.xml

#git branch -d master              # delete local master
#git push --delete origin master   # delete remote master
#git remote prune origin           # delete the remote tracking branch

#git branch -m master              # rename the local branch to master
#git push origin master            # make the new master branch remote
