#!/bin/sh

# Author: Akil Johnson

echo "Starting colima and minikube..."

# Start colima
colima start
sleep 3

# Shows a list of Docker images available
echo "Listing available Docker images"
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Shows all of the Docker processes actively running using a Go template
docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Names }}\t{{.Status}}'

# List the available profiles
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

# Start minikube dashboard...should open a new browser window. Add --url attribute to list url and open manually
minikube dashboard &
