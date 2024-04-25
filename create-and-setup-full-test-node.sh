#!/usr/bin/env bash
set -euxo pipefail

ec2/create-instance.sh
rsync -r --exclude=.git . agave:/home/ubuntu/setup-server
ssh agave 'cd setup-server && ./setup-full-test-node.sh'
ssh agave 'cp setup-server/agave/run-basic-validator.sh run-basic-validator.sh'
