#!/bin/sh

# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.100  master.example.com  master" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.101  node1.example.com  node1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.102  node2.example.com  node2" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.103  splunk.example.com  splunk" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.104  ansible.example.com  ansible" | sudo tee --append /etc/hosts 2> /dev/null

yum install epel-release
yum install -y python-setuptools gcc g++ make vim python-pip

pip install --upgrade pip
pip install --upgrade virtualenv
