alias ls="ls -FG"

# cdls
#	Change directory and list it
function cdls {
	if (( $# == 0 ))
	then
		cd ~
	else
		cd "$*"
	fi
	ls
}

alias cd="cdls"

alias .="cd ."
alias ..="cd .."
alias mei="cd ~/Documents/UMinho/MEI"

#	mkcd
#	Make a directory and change the working directory
function mkcd {
	mkdir $1
	cdls $1
}

# topen
# Touch a file and open it with default app
function topen {
	touch $1
	open $1
}

alias make="make --no-print-directory"
