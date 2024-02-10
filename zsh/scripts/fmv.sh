function fmv() {
    local dir="$1"
    local match="$2"
    local num_matches=5
    local selected_files=()

    # Function to display the usage instructions
    function display_usage() {
        echo "Usage: fmv <directory> <match_string> [-n <num>]"
        echo "       fmv -h | --help"
        echo "Options:"
        echo "  -n <num>   Number of matches to display (default: 5)"
        echo "  -h, --help Display this help message"
    }

    # Check if the help option is provided
    if [ "$dir" = "-h" ] || [ "$dir" = "--help" ]; then
        display_usage
        return
    fi

    # Check if the required arguments are provided
    if [ -z "$dir" ] || [ -z "$match" ]; then
        echo "Error: Insufficient arguments."
        display_usage
        return
    fi

    # Check if the directory exists
    if [ ! -d "$dir" ]; then
        echo "Error: Directory '$dir' does not exist."
        return
    fi

    # Check if the directory is readable
    if [ ! -r "$dir" ]; then
        echo "Error: Directory '$dir' is not readable."
        return
    fi

    # Check if the number of matches option is provided
    if [ "$3" = "-n" ] && [ -n "$4" ] && [ "$4" -gt 0 ]; then
        num_matches="$4"
    fi

    # Perform fuzzy matching and display the matches
    local matches=( $(find "$dir" -maxdepth 1 -type f -iname "*$match*" | head -n "$num_matches") )
    local num_files=${#matches[@]}

    if [ "$num_files" -eq 0 ]; then
        echo "No matching files found in directory '$dir'."
        return
    fi

    echo "Matching files in directory '$dir':"
    for ((i=1; i<=num_files; i++)); do
        echo "    $i: ${matches[$i]}"
    done

    # Prompt the user to select files to move
    echo "Enter the numbers of the files you want to move (separated by spaces):"
    read -r selected_nums

    # Validate and move the selected files
    for num in $selected_nums; do
        if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "$num_files" ]; then
            selected_files+=( "${matches[$num]}" )
        else
            echo "Invalid file number: $num"
        fi
    done

    # Move the selected files to the current directory
    for file in "${selected_files[@]}"; do
        mv "$file" .
        if [ $? -eq 0 ]; then
            echo "Moved: $file"
        else
            echo "Error moving file: $file"
        fi
    done
}
