# bc-rust-miner
![MIT licensed](https://img.shields.io/badge/license-MIT-green)
![Build](https://github.com/trick77/bc-rust-miner/workflows/ci/badge.svg)

An attempt to resuscitate an old Block Collider Rust crypto-miner implementation by @korczis, just for shits 'n giggles.

## How to build

```
./update-protos.sh
rustup install nightly
rustup update
rustup component add rust-src
RUST_BACKTRACE=full cargo build --release --verbose
```
