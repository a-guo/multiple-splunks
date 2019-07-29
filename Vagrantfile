# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
# BOX_IMAGE = "ubuntu/trusty32"

Vagrant.configure("2") do |config|
  config.vm.define "staging" do |staging|
    staging.vm.box = "precise64"
    staging.vm.box_url = "https://vagrantcloud.com/hashicorp/boxes/precise64/versions/1.1.0/providers/virtualbox.box"
    staging.vm.hostname = "staging"
    # staging.vm.network :private_network, ip: "192.168.68.10", auto_correct: true
    staging.vm.network :forwarded_port, guest:8000, host:8081
    config.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
    staging.vm.provision :shell, :path => ".provision/install.sh"
    staging.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
    end
  end
end
#
# Vagrant.configure("2") do |config|
#   config.vm.network "forwarded_port" , guest:8000, host:5433
#   config.vm.box = "precise64"
#   config.vm.box_url = "https://vagrantcloud.com/hashicorp/boxes/precise64/versions/1.1.0/providers/virtualbox.box"
#   config.vm.define "splunk7-box" do |splunk|
#     splunk.vm.hostname = "splunk"
#     splunk.vm.provision "shell", path: ".provision/install.sh"
#     splunk.vm.provider "virtualbox" do |v|
#                   v.memory = 4096
#                   v.cpus = 2
#               end
#       end
# end
