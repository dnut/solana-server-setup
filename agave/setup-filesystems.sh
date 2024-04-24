#!/usr/bin/env bash
set -euxo pipefail

ACCOUNTS_DISK=${ACCOUNTS_DISK:-'/dev/nvme1n1'}
DATA_DISK=${DATA_DISK:-'/dev/nvme2n1'}

config_fs() { local device=$1; local mount_point=$2;
    sudo mkfs.ext4 $device
    sudo bash -c "echo '$device   $mount_point   ext4   discard       0 1' >> /etc/fstab"
    sudo mkdir $mount_point
    sudo mount $mount_point
    sudo chown -R ubuntu $mount_point
}

config_fs $ACCOUNTS_DISK /mnt/accounts
config_fs $DATA_DISK /mnt/data
