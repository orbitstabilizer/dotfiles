# a function to move last downloaded file to current directory
function fetch() {
    # check if the given argument is a number
    if [[ $1 =~ ^[0-9]+$ ]]; then
        # if it is a number, use it as the number of files to move
        local num=$1
    else
        # if it is not a number, use 1 as the number of files to move
        local num=1
    fi
    # if the number of files to move is greater than 1, ask for confirmation
    if [[ $num -gt 1 ]]; then

        echo -n "Move $num files to current directory? [y/N] "
        read answer
        if [[ $answer != "y" ]]; then
            echo "Aborted."
            return
        fi
    fi

    for i in {1..$num}; do
        file=$(ls -t ~/Downloads | head -1)
        echo "Fetching $file"
        pwd | xargs mv ~/Downloads/"$file" 
    done
}
