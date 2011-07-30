# vim: set filetype=ruby:
Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.network "192.168.86.208"
  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organizations/ORG"
    chef.validation_key_path = "ORG-validator.pem"
    chef.validation_client_name = "ORG-validator"
    chef.run_list = ["recipe[getting-started]"]
    # chef.client_key_path = "/etc/chef/client.pem"
  end
  config.vm.customize do |v|
    v.name = "vagrant-chef-client"
    v.memory_size = 1024
  end
end
