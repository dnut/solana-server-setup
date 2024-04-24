#!/usr/bin/env bash
set -euxo pipefail

./apt-get.sh update
./apt-get.sh dist-upgrade

agave/tune-sys-performance.sh
agave/setup-filesystems.sh
agave/install-build-deps.sh && . ~/.profile
agave/install-init-cli.sh && . ~/.profile
agave/clone-and-build.sh

sig/install-build-deps.sh && . ~/.profile
sig/clone-build-init.sh
