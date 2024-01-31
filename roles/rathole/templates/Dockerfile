# Debian bookworm
FROM rust:latest as stage0

ENV RUSTFLAGS="-C target-feature=+crt-static"

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -y &&  apt-get install musl-tools -y

RUN git clone https://github.com/rapiz1/rathole

RUN rustup target install x86_64-unknown-linux-musl

RUN cd rathole && cargo build --release --target x86_64-unknown-linux-musl

FROM scratch as stage1

COPY --from=stage0 /rathole/target/x86_64-unknown-linux-musl/release/rathole /bin/rathole

CMD ["/bin/rathole"]