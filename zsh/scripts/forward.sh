function forward(){
    # arguments : remote_host, remote_port, [local_port]
    # example: forward oliver@localhost 8080 80 -> ssh -N -L 8080:localhost:80 oliver@localhost&
    # if no local_port is given, use the same port as remote_port

    if [ -z "$2" ]; then
        echo "Usage: forward <remote_host> <remote_port> [local_port]"
        return
    fi

    remote_host=$1
    remote_port=$2
    local_port=$3

    if [ -z "$local_port" ]; then
        local_port=$remote_port
    fi

    forward_command="ssh -N -L ${local_port}:localhost:${remote_port} ${remote_host}&"
    eval $forward_command

    echo "Forwarding localhost:${local_port} -> ${remote_host}:${remote_port}"
}

