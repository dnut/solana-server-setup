#!/usr/bin/env bash

# Minimal setup to hook up a validator to devnet

solana-validator \
    --identity ~/.config/solana/id.json \
    --limit-ledger-size \
    --ledger /mnt/data/ledger \
    --snapshots /mnt/data/snapshots \
    --accounts /mnt/accounts \
    --no-voting \
    --entrypoint entrypoint.devnet.solana.com:8001 \
    --entrypoint entrypoint2.devnet.solana.com:8001 \
    --entrypoint entrypoint3.devnet.solana.com:8001 \
    --entrypoint entrypoint4.devnet.solana.com:8001 \
    --entrypoint entrypoint5.devnet.solana.com:8001 \
    --log - | tee ~/solana-validator.log
