#!/usr/bin/env bash
set -euxo pipefail

SIG_REPO=${SIG_REPO:-https://github.com/Syndica/sig.git}
SIG_REF=${SIG_REF:-main}

cd $HOME
git clone $SIG_REPO
cd sig
git checkout $SIG_REF
zig build run -- identity
