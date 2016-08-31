FROM ubuntu:14.04

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --fix-missing update

# Setup basic tools
RUN apt-get install -y curl telnet wget apache2 openssh-server

# Setup SSH
RUN update-rc.d ssh defaults
COPY ./etc/ssh/sshd_config /etc/ssh/sshd_config

# Mount Volume
RUN mkdir -p /media/ephemeral

# Setup ssh authorized_keys
RUN mkdir ~/.ssh/
RUN chmod 700 /root/.ssh/
COPY ./keys/authorized_keys /root/.ssh/authorized_keys
COPY docker-entrypoint.sh /root/docker-entrypoint.sh

ENTRYPOINT /root/docker-entrypoint.sh