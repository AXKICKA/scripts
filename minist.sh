#!/bin/sh -
# Author: Akil Johnson
echo "Starting colima and minikube..."
# Start colima
colima start
sleep 3
# Shows a list of Docker images available
echo "Listing availabe Docker images"
sleep 2
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"
sleep 2
# Shows all of the Docker processes actively running using a Go template
docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Names }}\t{{.Status}}'
sleep 2
# Start minikube normally or with a particular version of Kubernetes, uncomment and change version number,
# minikube start --kubernetes-version=v1.24.3
minikube start
sleep 3
# Verify minikube is running
minikube status
# Open new terminal window
osascript -e 'tell app "Terminal"
   do script ""
end tell'
sleep 3
# Start minikube dashboard...should open a new browser window. Add --url attribute to list url and open manually
minikube dashboard &
