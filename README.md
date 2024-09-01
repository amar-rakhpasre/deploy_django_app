# Deploy Django App

## Overview

This project demonstrates how to deploy a Django application using a Vagrant-managed virtual machine (VM) with Docker and Nginx.

## Getting Started

### 1. Clone the Repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/your-username/deploy_django_app.git
cd deploy_django_app
```
### 2. Set File Permissions

Ensure that the deployment script (deploy_django_app.sh) has the correct permissions to be executed:
```bash
chmod 700 deploy_django_app.sh
```

### 3. Run the Deployment Script
Now, run the deployment script:
```bash
./deploy_django_app.sh
```
# Setting Up Vagrant
### 1. Download and Install VirtualBox
Download and install VirtualBox according to your operating system. You can find the installer [here.](https://www.virtualbox.org/)


### 2. Download and Install Vagrant
Download and install Vagrant according to your operating system. You can find the installer [here.](https://www.vagrantup.com/)


### 3. Initialize the Vagrant Environment
From your project directory, initialize and start the Vagrant environment:
```bash
vagrant up
```

## This command will:

##### Download the Vagrant box if it's not already available.
##### Set up the VM, configure networking, and start the VM.

### 4. SSH into the Vagrant VM
After the VM is up and running, you can SSH into it with:
```bash
vagrant ssh
```

## Port Forwarding
 By default, the Django app runs on port 8000 inside the Vagrant VM. To access it from your host machine, Vagrant will forward this port.

 Make sure your Vagrantfile includes the following port forwarding configuration:
```bash
config.vm.network "forwarded_port", guest: 8000, host: 8000
```

This ensures that requests to http://localhost:8000 on your host machine are forwarded to the Django app running inside the VM.

Running the Deployment Script
Once inside the Vagrant VM, the deployment script (deploy_django_app.sh) will automatically:

Clone the Django app repository.
Install necessary dependencies (Docker, Nginx).
Build and run the Django app inside a Docker container.
If you need to manually re-run the script:
```bash
./deploy_django_app.sh
```

## Accessing the Application
Once the deployment is successful, you can access the Django app in your browser on your host machine: http://localhost:8000/

## Troubleshooting
1. Port Forwarding Issues: Ensure that port 8000 is not being used by another service on your host machine.

2. Docker Permissions: If you encounter permission issues with Docker, ensure that your user has the correct permissions to access the Docker daemon.


