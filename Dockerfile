FROM rust:1.49 as build
WORKDIR /usr/src

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y musl-tools && \
    rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new miner
WORKDIR /usr/src/miner
COPY Cargo.toml Cargo.lock ./
RUN cargo install --target x86_64-unknown-linux-musl --path .

COPY src ./src

RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=build /usr/local/cargo/bin/bcrust-miner .
COPY static .

USER 1001
CMD ["./bcrust-miner"]
