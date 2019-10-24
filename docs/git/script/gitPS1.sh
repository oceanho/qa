#!/bin/bash
#
# A git extension script enhancement of PS1
# Created By OceanHo (gzhehai@foxmail.com) AT 2019/10/24

# retrieveGitCurrentBranch retrieve a git branch and working tree status of currentlly directory
function retrieveGitCurrentBranch(){
	local str=$(git branch 2>/dev/null | awk '$0 ~ /[*]/ {print $2}')
	if [ "$str" != "" ]; then
		local wt=$(git status | tail -n 1 | awk '$0 ~ /nothing to commit, working tree clean/ {print "clean"}')
		if [ "$wt" == "clean" ]; then
			# Working tree are clean, green color
			str="\033[1;32m($str)\033[0m"

		else
			# Working tree are clean, red color
			str="\033[0;31m($str)\033[0m"
		fi
		echo -e "$str"
	fi
}
# reference: http://bashrcgenerator.com/
export PS1="\[\033[38;5;12m\]\u@\h:\[$(tput sgr0)\]\[\033[38;5;6m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\$(retrieveGitCurrentBranch)\$ \[$(tput sgr0)\]"
