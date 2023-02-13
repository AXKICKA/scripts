#!/bin/bash

# Author: Akil Johnson Sept 17, 2022
tput setaf 2
echo "Starting docker (via colima) and minikube"
# tput srg0
# Start colima to enable kubernetes add --kubernetes
colima start

tput setaf 2
echo "Listing docker images on local host"
# tput srg0

# Shows a list of Docker images available with a go template
docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"


# Give an option to search and pull a known docker image
read -r -p $'\033[1;33mWould you like to search for or pull another Docker image? \033[1;35m[y/n]\033[0m ' response
if ["reponse" = "y"] ; then
	read -p "Enter 's' to search and 'p' to pull " action
	if ["action" = "s" ]; then
	docker search $image_name
	elif ["action" = "p" ]; then
	docker pull $image_name
	fi
fi

docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Shows all of the Docker processes actively running using a Go template
docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Names }}\t{{.Status}}'

# List the available local docker profiles. Each profile may run a different version kubernetes for instance
tput setaf 2
echo "Listing available minikube profiles"
# tput srg0

minikube profile list

# Prompt the user to select a profile or press ENTER for the default profile
read -p $'\033[1;33mType the profile name to use (Press RETURN for default): \033[0m' profile_name
if [ "$profile_name" = "" ]; then
	minikube start
else
# Start minikube using one of the listed profile options
	minikube start -p $profile_name
fi
# Verify minikube is running
minikube status

# Open new terminal window
osascript -e 'tell app "Terminal"
   do script ""
end tell'

# Start minikube dashboard...should open a new browser window. detached would be a better option. Add --url attribute to list url and open manually
minikube dashboard &
