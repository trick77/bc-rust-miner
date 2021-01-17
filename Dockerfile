FROM rust:142 as build

COPY ./src ./
RUN cargo build --release
RUN mkdir -p /build-out
RUN cp target/release/bcrust-miner /build-out

FROM debian:stable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install ca-certificates libssl-dev && rm -rf /var/lib/apt/lists/*

COPY --from=build /build-out/bcrust-miner

USER 1001
CMD /bcrust-miner


