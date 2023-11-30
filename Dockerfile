FROM alpine

RUN apk update && apk add git openssh-server \
	&& ssh-keygen -A \
	&& sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config \
	&& sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENTRYPOINT exec /usr/sbin/sshd -D
