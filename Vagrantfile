# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
# BOX_IMAGE = "ubuntu/trusty32"

Vagrant.configure("2") do |config|
  config.vm.define "staging" do |staging|
    staging.vm.box = "ubuntu/trusty32"
    staging.vm.hostname = "staging"
    # staging.vm.network :private_network, ip: "192.168.68.20", auto_correct: true
    staging.vm.network :forwarded_port, guest: 8000, host: 8081
    staging.vm.provision "fix-no-tty", type: "shell" do |s|
        s.privileged = false
        s.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
    end
    staging.vm.provision :shell, :path => ".provision/install.sh"
  end

  # config.vm.define "prod" do |prod|
  #   prod.vm.box = "trusty64"
  #   prod.vm.hostname = "prod"
  #   # prod.vm.network :private_network, ip: "192.168.68.11", auto_correct: true
  #   prod.vm.network :forwarded_port, guest: 8000, host: 8082
  #   prod.vm.provision :shell, :path => ".provision/install.sh"
  # end

end
