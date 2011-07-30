# vim: set filetype=ruby:
require "sample_command.rb"
Vagrant::Config.run do |config|
  config.vm.box = "maverick64camp"
  config.vm.network("192.168.86.104")

  config.vm.provision :chef_solo do |chef|
    # chef.recipe_url = "http://files.vagrantup.com/getting_started/cookbooks.tar.gz"
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe("vagrant_main")

    # you can refer this such as 'node[:load_limit]'
    # Json is merery Hash
    chef.json.merge!({
      :load_limit => 42,
      :chunky_bacon => true
    })

  end

  # config.vm.provision :puppet do |puppet|
    # puppet.module_path   = "modules"
    # puppet.manifest_file = "site.pp"
  # end

  config.vm.customize do |vm|
    vm.memory_size = 2048
    vm.name = "vagtest"
  end
end
