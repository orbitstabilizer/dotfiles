# This function creates a new log file in log directory
# and opens it with vim 
# The name of the log file is the current date and time in the YYYY-MM-DD.log format
# The log file is created in the ~/tmp/log directory
# If the log directory does not exist, prompt the user to create it
# If the log directory does not exist and the user does not want to create it, abort
# If the log file already exists, open it with vim
# If the log file does not exist, create it and open it with vim
# Append the current date and time as a comment to the log file
function makelog() {
    log_dir=~/tmp/log
    log_file=$(date +%Y-%m-%d).md

    # Check if log directory exists
    if [ ! -d "$log_dir" ]; then
        echo "Log directory does not exist. Do you want to create it? [Y/n]"
        read create_dir
        if [ "$create_dir" = "Y" ] || [ "$create_dir" = "y" ]; then
            mkdir -p "$log_dir"
        else
            echo "Log directory not created. Aborting."
            return
        fi
    fi

    log_path="$log_dir/$log_file"

    if [ "$1" = "-l" ]; then
        ls -l "$log_dir" 
        return
    fi

    # Check if log file exists
    if [ -f "$log_path" ]; then
        
        if [ "$1" = "-d" ]; then
            rm "$log_path"
            echo "Deleted previous log file."
        elif [ "$1" = "-m" ]; then
            if [ -n "$2" ]; then
                echo "----------------------------------------" >> "$log_path"
                echo "[ $(date +%H:%M:%S) ]: $2" >> "$log_path"
                echo "Logged: $2"
            else
                echo "No log message provided."
            fi
        elif [ "$1" = "-r" ]; then 
            vim "$log_path"
        else
            # Open log file with Vim and append timestamp before each log entry
            echo "----------------------------------------" >> "$log_path"
            vim +"normal Go[ $(date +%H:%M:%S) ]: " +"startinsert" "$log_path"
        fi
    else
        # Create log file, add initial timestamp, and open with Vim
        echo "# $(date)" > "$log_path"
        echo "----------------------------------------" >> "$log_path"
        vim +"normal Go[ $(date +%H:%M:%S) ]: " +"startinsert" "$log_path"
    fi
}
