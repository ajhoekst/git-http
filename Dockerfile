# Download base image
FROM alpine:latest

# Set maintainer
MAINTAINER Andrew Hoekstra <git-http@andrewhoekstra.com>

# Update package list
RUN apk update

# Install packages
RUN apk add --update \
        git \
        nginx \
        openssl

# Clean apt cache to keep image small
RUN rm -rf /var/lib/apt/lists/*

# Make the container externally accessible
EXPOSE 80 443

# Run ash
CMD /bin/ash
