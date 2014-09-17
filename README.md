# This project's structure and scripts are based on the work by:

    https://github.com/emmanuel/coreos-skydns-cloudformation

# The cluster runs on AWS EC2 using Cloud Formation. cloud-init includes:

* etcd
* fleet

# Fleet is then used to deploy:

* registry

# Requirements

* install aws client
* aws client needs to be configured with an AWS credential.

```bash
aws configure
```

* Get AWS ssh private key for the 'coreoscluster01' keypair in s3, and then `ssh-add` it. Alternatively, generate your own key pair and upload it to our AWS account 
(you'll need to refer to this key in the create_stack command below).

Wait a few minutes, then get a public hostname or ip from one of your new instances from the AWS console. Then set:

```bash
export FLEETCTL_TUNNEL={resolvable address of one of your cloud instances}
coreos/launch_units.sh
```

# Handy hints

You can test some changes to your cloud without needing to destroy and re-create. SCP your file to a host and:

``` bash
sudo /usr/bin/coreos-cloudinit --from-file /tmp/user-data.yml
```
