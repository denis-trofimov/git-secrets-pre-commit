FROM alpine:latest

RUN apk --update add --no-cache bash git make

RUN git clone https://github.com/awslabs/git-secrets.git && \
    cd git-secrets && \
    make install && \
    git secrets --register-aws --global

# Best Practices for Non-root User
# ref: https://github.com/mhart/alpine-node/issues/48
RUN addgroup -S app && adduser -S -G app app
USER app
