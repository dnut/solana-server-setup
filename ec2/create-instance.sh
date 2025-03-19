#!/usr/bin/env bash
set -euxo pipefail

. "${SERVER_CONF:-server.conf}"

cli_input_json="$(jq "
.ImageId |= \"$AWS_AMI_ID\" |
.InstanceType |= \"$AWS_INSTANCE_TYPE\" |
.KeyName |= \"$AWS_SSH_KEY_NAME\" |
.BlockDeviceMappings[0].Ebs.SnapshotId |= \"$AWS_SNAPSHOT_ID\" |
.BlockDeviceMappings[0].Ebs.VolumeSize |= $ROOT_VOLUME_SIZE |
.BlockDeviceMappings[1].Ebs.VolumeSize |= $ACCOUNTS_VOLUME_SIZE |
.BlockDeviceMappings[2].Ebs.VolumeSize |= $DATA_VOLUME_SIZE |
.NetworkInterfaces[0].Groups[0] |= \"$AWS_NETWORK_INTERFACE_GROUP\" |
.TagSpecifications[0].Tags[0].Value |= \"$AWS_INSTANCE_NAME\"
" ec2/solana-node.json)"

instance_id=$(
    aws ec2 run-instances --profile $AWS_PROFILE --cli-input-json "$cli_input_json" \
    | jq -r .Instances[0].InstanceId)

elastic_ip_allocation_json="$(aws ec2 --profile solana-server-setup allocate-address)"
allocation_id=$(jq -r .AllocationId <<< $elastic_ip_allocation_json)
elastic_ip_address=$(jq -r .PublicIp <<< $elastic_ip_allocation_json)

sleep 5

aws ec2 associate-address \
    --profile $AWS_PROFILE \
    --instance-id $instance_id \
    --allocation-id $allocation_id

echo instance deployed with ip: $elastic_ip_address
echo $elastic_ip_address >&3
