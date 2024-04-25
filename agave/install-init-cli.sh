#!/usr/bin/env bash
set -euxo pipefail

sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
. ~/.profile

solana-keygen new --no-bip39-passphrase
solana -ud airdrop 1
