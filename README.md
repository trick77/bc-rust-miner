# bc-rust-miner
https://img.shields.io/badge/license-MIT-green
![MIT licensed](https://img.shields.io/badge/license-MIT-green)
[![Linux build status](https://travis-ci.com/trick77/bc-rust-miner.svg)](https://travis-ci.com/trick77/bc-rust-miner)

An attempt to resuscitate an old Block Collider Rust miner implementation by @korczis but be prepared to Waietng... a lot

## How to build

./get-protos.sh
rustup install nightly
rustup update
rustup component add rust-src
cargo build --release
