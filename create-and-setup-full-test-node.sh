#!/usr/bin/env bash
set -euxo pipefail

. "${SERVER_CONF:=server.conf}"
export SERVER_CONF

# run the script and capture the data that script writes to fd 3 (the ip address)
exec 4>&1
instance_ip=$(ec2/create-instance.sh 3>&1 1>&4)
exec 4>&-
sleep 10

# run all the other scripts on the server
ssh_command="ssh -o StrictHostKeyChecking=no -i $SSH_KEY_PATH -o SendEnv=SERVER_CONF"
rsync -e "$ssh_command" -r --exclude=.git . $AWS_SSH_USER_NAME@$instance_ip:/home/ubuntu/setup-server
$ssh_command $AWS_SSH_USER_NAME@$instance_ip 'cd setup-server && ./setup-full-test-node.sh'
$ssh_command $AWS_SSH_USER_NAME@$instance_ip 'cp setup-server/agave/run-basic-validator.sh run-basic-validator.sh'

echo finished setting up server at $instance_ip
