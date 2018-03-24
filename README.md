
# Initial setup
0. You may have to turn on virtualisation settings in your BIOS
0. Install virtualbox and vagrant (in that order).
0. checkout this project
1. Put your private ssh key in secrets/id_rsa
2. Copy secrets/vars.yml.example to secrets/vars.yml and fill in the variables
3. You might want to try changing the config.vm.box_version value in Vagrantfile to the latest from https://app.vagrantup.com/ubuntu/boxes/xenial64
4. add your .aws/config to secrets/aws_config
> $ vagrant plugin install vagrant-vbguest
> $ vagrant plugin install vagrant-proxyconf
> $ vagrant up --provision

# Basic usage
To get into the box:
> $ vagrant ssh

Cache your ssh password:
> $ sshagent

# More disk space
The expandFS.sh script will automatically expand the root disk from 10G to 100G.
Then follow the instructions at the end of the script for the last steps.

# Usage for on AWS

1. Clone repo onto AWS VM
2. set up the secrets/vars.yml - note you should not put or need to put your AWS
key, or ssh key on the VM
3. In the ansible dir run:

> $ ansible-playbook -i inventory/localhost.yml aws_provision.yml
