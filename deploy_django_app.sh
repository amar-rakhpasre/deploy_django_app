#!/bin/bash

<< task

Deploy the django app
and handle the code for errors

task


code_clone() {
	echo "Cloning the Djanho app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git

}


install_requirement() {
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

requied_restatrs() {
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
}

deploy() {
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}


echo "*********** DEPLOYMENT STATRTED ************"
if ! code_clone; then
	echo "***the code directory already exists***"
	cd django-notes-app
fi

if ! install_requirement; then
	echo "Installation failed"
	exit 1
fi


if ! requied_restatrs; then
	echo "Sysytem fault identified"
	exit 1
fi

deploy

echo "*********** DEPLOYMENT DONE ************"
