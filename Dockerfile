# Download base image
FROM nginx:alpine

# Set maintainer
MAINTAINER Andrew Hoekstra <git-http@andrewhoekstra.com>

# Install packages
RUN apk update                                              &&  \
    apk add                                                     \
        git                                                     \
        openssl                                             &&  \
    rm -rf /var/cache/apk/*                                 &&  \
    mkdir /git                                              &&  \
    adduser git -h /git -D                                  &&  \
    adduser nginx git -D                                    &&  \
    chown -R git:git /git                                   &&  \
    chmod -R 775 /git                                       &&  \
    /usr/bin/spawn-fcgi                                         \
        -s /var/run/fcgiwrap.socket                             \
        -F 2                                                    \
        -u nginx                                                \
        -G git                                              --  \
    /usr/bin/fcgiwrap                                       &&  \
    git config --system http.receivepack true               &&  \
    git config --system http.uploadpack ture                &&  \
    git config --system user.email "git@andrewhoekstra.com" &&  \
    git config --system user.name "Git Server"
        

# Make the container externally accessible
EXPOSE 80 443
