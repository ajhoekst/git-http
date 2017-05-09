# Download base image
FROM apline:latest

# Set maintainer
MAINTAINER Andrew Hoekstra <git-http@andrewhoekstra.com>

# Update package list
RUN apk

# Install packages
RUN apt-get install -y \
        git-core \
        nginx \
        openssl

# Clean apt cache to keep image small
RUN rm -rf /var/lib/apt/lists/*

# Make the container externally accessible
EXPOSE 80 443

# Run bash
RUN /bin/bash