FROM rust:1-alpine3.19

ENV RUSTFLAGS="-C target-feature=+crt-static"

ENV OPENSSL_NO_VENDOR="n"

RUN apk add git build-base openssl-dev musl-dev libc6-compat

RUN cargo build --release --target x86_64-unknown-linux-musl

WORKDIR /app