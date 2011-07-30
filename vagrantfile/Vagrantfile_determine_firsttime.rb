firsttime = ! File.exist?(".vagrant")
Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://share.example.local/boxes/lucid64.box"
  config.vm.network "192.168.86.205"
  config.vm.customize do |v|
    v.name = "chefdev"
    v.memory_size = 1024
  end
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef-repo/cookbooks/"
    chef.add_recipe "dummy"
    if firsttime
      chef.run_list = [
        "recipe[dummy]",
      ]
    else
      chef.run_list = [
        "recipe[vagrant_main]",
        "recipe[apt]",
        "recipe[ntp]",
        "recipe[resolver]",
        # "recipe[ca_ldap]",
      ]
    end
    chef.json= {
        :ntp  => {
          # :servers => ["192.168.5.5", "192.168.5.6" ],
          # :is_server => false
        },
        :resolver  => {
          :search => "example.com",
          :nameservers => [ "1.2.3.4", "1.2.3.5" ]
        },
        :reposerver  => "2.3.5.7",
        :ssh_pubkey  => File.read(File.expand_path("~/.ssh/id_rsa.pub"))
    }
  end
end
