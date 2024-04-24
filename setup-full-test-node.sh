#!/usr/bin/env bash
set -euxo pipefail

./apt-get.sh update
./apt-get.sh dist-upgrade

agave/install-build-deps.sh
agave/tune-sys-performance.sh
agave/filesystems.sh
agave/cli.sh
agave/clone-and-build.sh

sig/install-build-deps.sh
sig/clone-build-init.sh
