FROM rust:1.49 as build

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y unzip musl-tools && \
    rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src

# Install protoc
ARG PROTOC_VERSION=3.14.0
RUN curl -OL https://github.com/google/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip \
    && unzip protoc-$PROTOC_VERSION-linux-x86_64.zip -d ./ \
    && rm -rf protoc-$PROTOC_VERSION-linux-x86_64.zip
ENV PATH "/usr/src/bin:$PATH"

COPY . /usr/src/

RUN cargo install --locked --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=build /usr/local/cargo/bin/bcrust-miner .
#COPY static .

USER 1001
CMD ["./bcrust-miner"]

