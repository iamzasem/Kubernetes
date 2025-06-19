#!/bin/bash
set -e

# Download latest kubectl for x86_64 (amd64)
echo "Downloading kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Download and validate sha256
echo "Validating kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl
echo "Installing kubectl..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo " kubectl installation complete"

# Install minikube
echo "Downloading minikube..."
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

echo "Installing minikube..."
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64

echo " minikube installation complete"

# Start cluster
echo "Starting minikube cluster..."
minikube start


echo "installation guide by @iamzasem "
