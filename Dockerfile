# Download base image
FROM nginx:alpine

# Set maintainer
MAINTAINER Andrew Hoekstra <git-http@andrewhoekstra.com>

# Update package list
RUN apk update

# Install packages
RUN apk add \
        git \
        openssl

# Clean apk cache to keep image small
RUN rm -rf /var/lib/apk/*

# Make the container externally accessible
EXPOSE 80 443

# Run ash
ENTRYPOINT ["/bin/ash"]