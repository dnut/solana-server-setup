#!/usr/bin/env bash
set -euxo pipefail


# aws ec2 run-instances --cli-input-json file://ec2/solana-node.json

IID=$(aws ec2 run-instances --cli-input-json file://ec2/solana-node.json | jq .Instances[0].InstanceId)
AID=eipalloc-0673b260011258f64
aws ec2 associate-address --instance-id $IID --allocation-id $AID
