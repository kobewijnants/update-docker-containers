#!/usr/bin/env

# run as sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Update all Docker containers
function update_container {
    docker container update --restart=unless-stopped $(sudo docker container ls -aq)
}

# show the list of containers
function list_containers {
    docker container ls --format "{{.Names}}"
}

# choose containers to update
function choose_containers {
    read -p "Choose containers to update: " containers
    IFS=',' read -ra container_array <<<"$containers"
    for container in "${container_array[@]}"; do
        docker container update --restart=unless-stopped "$container"
    done

}
