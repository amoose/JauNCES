# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 64-bit as our operating system
  config.vm.box = 'ubuntu/trusty64'

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  config.vm.box = 'opscode-ubuntu-12.04_chef-11.4.0'
  config.vm.box_url = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box'
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks']
    chef.add_recipe :apt
    # chef.add_recipe "nodejs"
    chef.add_recipe 'mongodb::default'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'redis'
    chef.json = {
      mongodb: {
        dbpath: '/var/lib/mongodb',
        logpath: '/var/log/mongodb',
        port: '27017'
      },
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ['2.2.3'],
          global: '2.2.3',
          gems: {
            '2.2.3' => [
              { name: 'bundler' }
            ]
          }
        }]
      }
    }
  end

  # Setup freegeoip server in Virtual Machine
  $script = <<SCRIPT
echo Setting up local freegeoip server...
sudo apt-get update
sudo apt-get install docker.io -y
docker run --net=host --restart=always -d fiorix/freegeoip
curl localhost:8080/json/1.2.3.4
echo freegeoip server up and running!
echo "=========================================="

echo Importing Schools from sample data...
cd /vagrant/JauNCES
NCES_IMPORT_DIR=/vagrant/JauNCES/lib/tasks/nces-data rake nces:import:csv
echo "=========================================="

echo Creating database indexes for searchability...
rake db:mongoid:create_indexes
echo "=========================================="

echo "ALL DONE!!!"
SCRIPT

  config.vm.provision 'shell', inline: $script
end
