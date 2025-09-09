FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update & install OpenSSH + ttyd + basic tools
RUN apt update && \
    apt install -y openssh-client openssh-server curl wget git nano ttyd && \
    apt clean

# Set default root password for SSH server
RUN mkdir /var/run/sshd && \
    echo 'root:koyeb123' | chpasswd

# Expose ttyd (web terminal) on port 8000
EXPOSE 8000

# Expose SSH server on port 22 (optional)
EXPOSE 22

# Start ttyd by default on port 8000
CMD ["ttyd", "-p", "8000", "bash"]
