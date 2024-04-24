#!/usr/bin/env bash
set -euxo pipefail

SOLANA_REPO=$(SOLANA_REPO:-https://github.com/anza-xyz/agave.git)
SOLANA_REF=$(SOLANA_REF:-master)

git clone $SOLANA_REPO
cd solana
git checkout $SOLANA_REF
./cargo build --release -p solana-validator -p solana-keygen -p solana-cli
