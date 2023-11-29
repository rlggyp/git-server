FROM alpine

ARG NEW_USER
ENV NEW_USER=$NEW_USER

ARG PASSWORD
ENV PASSWORD=$PASSWORD

RUN adduser -D -h /home/$NEW_USER/ $NEW_USER \
	&& (echo $PASSWORD; echo $PASSWORD) | passwd $NEW_USER \
	&& apk update && apk add git openssh-server \
	&& ssh-keygen -A \
	&& sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config

ENTRYPOINT exec /usr/sbin/sshd -D
