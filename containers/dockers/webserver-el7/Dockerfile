FROM traqy/centos7-systemd
MAINTAINER "Bernard Traquena" <btraquena@gmail.com>
ENV container docker
VOLUME ["/sys/fs/cgroup"]

RUN yum clean metadata && yum install -y openssh-server net-tools telnet

RUN systemctl enable sshd.service
#RUN systemctl start sshd.service

# Mount Volume
RUN mkdir -p /media/ephemeral

# Setup ssh authorized_keys
RUN mkdir -p ~/.ssh/
RUN chmod 700 /root/.ssh/
COPY ./keys/authorized_keys /root/.ssh/authorized_keys
COPY docker-entrypoint.sh /root/docker-entrypoint.sh

#ENTRYPOINT /root/docker-entrypoint.sh
CMD ["/usr/sbin/init"]