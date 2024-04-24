#!/usr/bin/env bash
set -euxo pipefail

./apt-get.sh install gcc

# install zig
cd $HOME/.local/share/
wget https://ziglang.org/download/0.11.0/zig-linux-x86_64-0.11.0.tar.xz
tar xf  zig-linux-x86_64-0.11.0.tar.xz
rm -rf  zig-linux-x86_64-0.11.0.tar.xz
wget https://github.com/zigtools/zls/releases/download/0.11.0/zls-x86_64-linux.tar.gz
tar xf zls-x86_64-linux.tar.gz
mv bin/zls  zig-linux-x86_64-0.11.0/
rm LICENSE
rm README.md
rm -r bin/
rm zls-x86_64-linux.tar.gz
chmod +x  zig-linux-x86_64-0.11.0/zls
echo 'PATH=$PATH:$HOME/.local/share/zig-linux-x86_64-0.11.0' >> ~/.profile
touch ~/.lldbinit
