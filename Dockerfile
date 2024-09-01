FROM ubuntu:24.04

RUN apt update && apt install -y \
    curl \
    unzip

# AWS CLI
RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws*

COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
