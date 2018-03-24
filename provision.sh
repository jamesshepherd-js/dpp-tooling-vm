#! /bin/bash
set -e
set -u
set -o pipefail

function install_ansible {
  apt-get -y install software-properties-common
  apt-get -y update
  apt-get -y upgrade
  apt-get -y install python-pip
  apt-get -y remove ansible
  pip install ansible==2.1.1.0 pyOpenSSL
}

install_ansible
