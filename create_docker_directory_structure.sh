#!/bin/bash

# Define the base directory
baseDir="/srv/docker/drap-app"

# Define the root paths
rootPaths=(
    "certificates"
    "container-mnts/drap-db-server-mnts/certs"
    "container-mnts/drap-db-server-mnts/stage/data"
    "container-mnts/drap-db-server-mnts/prod/data"
    "container-mnts/drap-portal-mnts/stage/config"
    "container-mnts/drap-portal-mnts/prod/config"
    "container-mnts/seq-mnt/data"
)

# Create the base directory if it does not exist
if [ ! -d "$baseDir" ]; then
    sudo mkdir -p "$baseDir"
    echo "Created base directory: $baseDir"
else
    echo "Base directory already exists: $baseDir"
fi

# Set ownership and permissions for the base directory
sudo chown -R $USER:docker "$baseDir"
sudo chmod -R 775 "$baseDir"
echo "Set ownership and permissions for: $baseDir"

# Create the directory structure
for path in "${rootPaths[@]}"; do
    fullPath="$baseDir/$path"
    if [ ! -d "$fullPath" ]; then
        mkdir -p "$fullPath"
        echo "Created directory: $fullPath"
    else
        echo "Directory already exists: $fullPath"
    fi
done

# Verify the setup
echo "Directory structure creation complete. Verifying setup..."
ls -ld "$baseDir"