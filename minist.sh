#!/bin/sh

# Author: Akil Johnson Sept 17, 2022

echo "Starting docker cli (via colima) and minikube..."

# Start colima to enable kubernetes add --kubernetes
colima start


echo "Listing available Docker images"
# Shows a list of Docker images available with a go template
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Shows all of the Docker processes actively running using a Go template
docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Names }}\t{{.Status}}'

# List the available local docker profiles. Each profile may run a different version kubernetes for instance
echo "Listing available profiles..."
minikube profile list

# Prompt the user to select a profile
read -p "Enter the profile name to use: " profile_name

# Start minikube using the selected profile
minikube start -p $profile_name

# Verify minikube is running
minikube status

# Open new terminal window
osascript -e 'tell app "Terminal"
   do script ""
end tell'

# Start minikube dashboard...should open a new browser window. detached would be a better option. Add --url attribute to list url and open manually
minikube dashboard &
