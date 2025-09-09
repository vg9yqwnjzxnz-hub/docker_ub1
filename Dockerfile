FROM alpine:latest

# Update base system & install basic tools
RUN apk update && apk add --no-cache bash curl nano

# Keep container alive (no SSH yet)
CMD ["/bin/bash"]
