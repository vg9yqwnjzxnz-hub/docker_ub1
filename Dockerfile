FROM alpine:latest

# Install OpenSSH and bash
RUN apk update && apk add --no-cache openssh bash

# Set root password
RUN echo "root:koyeb123" | chpasswd

# Generate SSH host keys if missing
RUN ssh-keygen -A

# Allow root login & enable password authentication
RUN sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH daemon in foreground (important for Koyeb)
CMD ["/usr/sbin/sshd", "-D"]
