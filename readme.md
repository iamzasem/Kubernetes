
---

````markdown
# Kubernetes & Minikube Local Installer Script

This repository provides a simple Bash script to install the latest versions of `kubectl` and `minikube` on a Linux system (x86_64 architecture).

## What It Does

- Downloads and installs the latest stable version of `kubectl`
- Verifies the binary with SHA256 checksum
- Downloads and installs the latest stable version of `minikube`
- Starts a local Kubernetes cluster

## Prerequisites

- Linux system (tested on Debian/Ubuntu-based distributions)
- curl
- sha256sum
- sudo privileges
- Docker installed and running (used as the minikube driver)

Install Docker (if not already installed):

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
````

Log out and log back in for group changes to take effect.

## How to Use

1. Clone the repository:

```bash
git clone https://github.com/iamzasem/Kubernetes.git
cd k8s-local-installer
```

2. Make the script executable:

```bash
chmod +x install_k8s.sh
```

3. Run the script:

```bash
./install_k8s.sh
```

This will:

* Install `kubectl` to `/usr/local/bin`
* Install `minikube` to `/usr/local/bin`
* Start a local Kubernetes cluster using Docker

## Verifying Installation

Check versions:

```bash
kubectl version --client
minikube version
```

Check if cluster is running:

```bash
kubectl get nodes
```

## Example: Deploy a Sample App

```bash
kubectl create deployment nginx --image=nginx
kubectl expose deployment nginx --type=NodePort --port=80
minikube service nginx
```

## File Structure

| File            | Description                                  |
| --------------- | -------------------------------------------- |
| install\_k8s.sh | Shell script for installing Kubernetes tools |
| README.md       | Documentation                                |

---
