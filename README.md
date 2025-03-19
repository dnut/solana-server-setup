Go from zero to running a solana validator with a single turnkey script.

This automates the entire process of setting up a server from scratch to run agave or sig. It optionally launches an ec2 instance, then it configures your server to run the validator.

## Launch and setup EC2 instance from scratch

This uses the aws cli to launch an ec2 instance, then automatically SSH in and set everything up. You'll need to have the aws cli locally installed and authenticated.

```bash
cp server.template.conf server.conf    # copy config template
vim server.conf                        # populate missing configuration
./create-and-setup-full-test-node.sh   # launch and setup instance
```

Normally the scripts expect to find `server.conf` in the working directory, but you can specify any arbitrary path with the `SERVER_CONF` variable:

```bash
SERVER_CONF=/path/to/mynode1.server.conf ./create-and-setup-full-test-node.sh
```

## Set up an existing server

Alternatively, if you already have a running server, you can run this on the server to set up the server. The OS needs to be ubuntu, with two drives at /dev/nvme1n1 and /dev/nvme1n2 available for ledger and data.

```bash
cp server.template.conf server.conf    # copy config template (no changes needed)
./setup-full-test-node.sh
```

> *Note: If you already created your server with `create-and-setup-full-test-node.sh`, you do not need to execute `setup-full-test-node.sh`. It was already run by that script.*

## Run the validator

`agave-validator` is installed on the machine and you can call it with the CLI options of your choosing. If you just want to start up a basic node with sane defaults, run the script that was installed for this purpose:

```
/home/ubuntu/run-basic-validator.sh
```
