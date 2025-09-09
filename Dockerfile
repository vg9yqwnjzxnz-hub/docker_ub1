# Use a tiny Linux image
FROM alpine:latest

# Install OpenSSH
RUN apk update && apk add --no-cache openssh bash

# Set root password (change this!)
RUN echo "root:koyeb123" | chpasswd

# Enable root login in SSH
RUN mkdir -p /var/run/sshd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server when container starts
CMD ["/usr/sbin/sshd", "-D"]
