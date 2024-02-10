


function tolower(){
    tr '[:upper:]' '[:lower:]' <<< "$@"
}

function setenv() {
	# copy ~/tmp/clean to current directory
	cp -r ~/tmp/clean .
	./clean -c
}

function so() {
    source ~/.zshrc
    echo "Sourced ~/.zshrc"
}


