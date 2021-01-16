# bc-rust-miner
![MIT licensed](https://img.shields.io/badge/license-MIT-green)
![Rust](https://github.com/trick77/bc-rust-miner/workflows/Rust/badge.svg)

An attempt to resuscitate an old Block Collider Rust miner implementation by @korczis but be prepared to Waietng... a lot

## How to build

```
./update-protos.sh
rustup install nightly
rustup update
rustup component add rust-src
RUST_BACKTRACE=full cargo build --release --verbose
```
