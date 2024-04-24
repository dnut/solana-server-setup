#!/usr/bin/env bash
set -euxo pipefail

AGAVE_REPO=${AGAVE_REPO:-https://github.com/anza-xyz/agave.git}
AGAVE_REF=${AGAVE_REF:-master}

cd $HOME
git clone $AGAVE_REPO
cd agave
git checkout $AGAVE_REF
./cargo build --release -p agave-validator -p solana-keygen -p solana-cli
