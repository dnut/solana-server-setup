#!/usr/bin/env bash
set -euxo pipefail

./apt-get.sh install gcc

# install zig
cd $HOME/.local/share/
wget https://ziglang.org/download/0.12.0/zig-linux-x86_64-0.12.0.tar.xz
tar xf  zig-linux-x86_64-0.12.0.tar.xz
rm -rf  zig-linux-x86_64-0.12.0.tar.xz
wget https://github.com/zigtools/zls/releases/download/0.12.0/zls-x86_64-linux.tar.xz
tar xf zls-x86_64-linux.tar.xz
mv zls  zig-linux-x86_64-0.12.0/
rm LICENSE
rm README.md
rm zls-x86_64-linux.tar.xz
chmod +x  zig-linux-x86_64-0.12.0/zls
echo 'PATH=$PATH:$HOME/.local/share/zig-linux-x86_64-0.12.0' >> ~/.profile
touch ~/.lldbinit
