#!/bin/sh

# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.100  master.example.com  master" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.101  node1.example.com  node1" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.65.102  node2.example.com  node2" | sudo tee --append /etc/hosts 2> /dev/null

# Add agent section to /etc/puppet/puppet.conf
echo "" && echo "[agent]\nserver=master.example.com" | sudo tee --append /etc/puppet/puppet.conf 2> /dev/null

#Install PuppetAgent from Puppet-PE Master Server
curl -k https://master.example.com:8140/packages/current/install.bash | sudo bash
