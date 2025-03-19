
### full solana testing node

Sets up a server to run agave or sig from source or binary.

Copy server.template.conf to server.conf and populate the missing configuration. To manage multiple server.conf files, you can give it a custom name such as node1.server.conf and export SERVER_CONF=node1.server.conf before running the scripts.

Run `create-and-setup-full-test-node.sh` for the end-to-end setup. This uses the aws cli to create the instance, then automatically SSH in and set everything up.

Alternatively, if you've already created the ec2 instance, you can run this one-liner on the server to initialize the server. The OS needs to be ubuntu, with two drives at /dev/nvme1n1 and /dev/nvme1n2 available for ledger and data.

```bash
git clone https://github.com/dnut/solana-server-setup.git && cd solana-server-setup && ./setup-full-test-node.sh
```
