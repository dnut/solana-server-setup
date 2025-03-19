#!/usr/bin/env bash
set -euxo pipefail

. "${SERVER_CONF:-server.conf}"

./apt-get.sh install gcc

# install zig
mkdir -p $HOME/.local/share/
cd $HOME/.local/share/
wget https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz
tar xf  zig-linux-x86_64-${ZIG_VERSION}.tar.xz
rm -rf  zig-linux-x86_64-${ZIG_VERSION}.tar.xz
wget https://github.com/zigtools/zls/releases/download/${ZIG_VERSION}/zls-x86_64-linux.tar.xz
tar xf zls-x86_64-linux.tar.xz
mv zls zig-linux-x86_64-${ZIG_VERSION}
rm LICENSE
rm README.md
rm zls-x86_64-linux.tar.xz
chmod +x  zig-linux-x86_64-${ZIG_VERSION}/zls
echo 'PATH=$PATH:$HOME/.local/share/zig-linux-x86_64-'$ZIG_VERSION >> ~/.profile
touch ~/.lldbinit
