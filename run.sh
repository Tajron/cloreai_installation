#!/bin/bash

# Define a function to handle errors and exit
handle_error() {
    echo "Error: $1"
    exit 1
}

# Command 1: Update NVIDIA drivers using hive-replace
echo "Updating NVIDIA drivers..."
nvidia-driver-update || handle_error "Failed to update NVIDIA drivers"

# Command 2: Clone the Git repository
echo "Cloning Git repository..."
git clone https://gitlab.com/cloreai-public/hosting || handle_error "Failed to clone Git repository"

# Move into the cloned repository directory
cd hosting || handle_error "Failed to change directory to hosting"

# Command 3: Run installation script
echo "Running installation script..."
./install.sh || handle_error "Failed to run installation script"

# Command 4: Install NVIDIA CUDA Toolkit
echo "Installing NVIDIA CUDA Toolkit..."
apt install nvidia-cuda-toolkit || handle_error "Failed to install NVIDIA CUDA Toolkit"

# Command 5: Initialize with token
echo "Initializing with token..."
/opt/clore-hosting/clore.sh --init-token "$1" || handle_error "Failed to initialize with token"
