#!/usr/bin/env bash
set -euxo pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo '. "$HOME/.cargo/env"' >> ~/.profile
. ~/.profile
rustup default stable
./apt-get.sh install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang libclang-dev cmake make libprotobuf-dev protobuf-compiler
