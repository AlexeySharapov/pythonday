FROM risingstack/alpine:3.3-v4.3.1-3.0.1


# Add your source files
WORKDIR /usr/src/app
COPY hello.js ./
RUN node hello.js
