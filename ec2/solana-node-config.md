based on https://solana.com/developers/guides/rpc/configure-solana-rpc-on-aws with reduced storage

create with solana-node.json in RunInstances, or:

- give name
- AMI: ubuntu
- Instance type: r6a.8xlarge
- key pair: drew macbook
- network settings
  - select existing
  - allow-all
- storage
  - root: 100 GB - 250 throughput
  - accounts: 500 GB - 700 throughput
  - data: 500 GB - 700 throughput

then, allocate an elastic IP address and associate it with the instance

run setupnodes.sh on the server
