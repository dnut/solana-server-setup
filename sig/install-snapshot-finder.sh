#!/usr/bin/env bash
set -euxo pipefail

sudo apt-get install python3-venv
git clone https://github.com/dnut/solana-snapshot-finder
cd solana-snapshot-finder
sudo make install
