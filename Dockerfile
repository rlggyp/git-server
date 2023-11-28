FROM ubuntu

ARG NEW_USER
ARG PASSWORD

ENV NEW_USER=$NEW_USER
ENV PASSWORD=$PASSWORD

RUN ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime \
	&& useradd -m $NEW_USER \
	&& (echo $PASSWORD; echo $PASSWORD) | passwd $NEW_USER \
	&& apt-get update \
	&& apt-get install ssh git -y \
	&& rm -rf /var/lib/apt/lists \
	&& mkdir /run/sshd \
	&& sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

ENTRYPOINT exec /usr/sbin/sshd -D
