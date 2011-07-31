$default_opt = {
  :memory_size => 512,
}

def bootstrap(config, opt)
  config.vm.box = "lucid64"
  config.vm.network opt[:ip]
  config.vm.customize do |v|
    v.name = opt[:hostname]
    v.memory_size = 1024
  end
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [ 
      "recipe[apt]",
      "recipe[build-essential]",
      "recipe[vagrant_main]",
    ]
    chef.cookbooks_path = "cookbooks"
    chef.json = {
      :ssh_pubkey => File.read(File.expand_path("~/.ssh/id_rsa.pub")),
      :my_hostname => opt[:hostname],
      :my_fqdn => "#{opt[:hostname]}.example.com",
    }
  end
end

Vagrant::Config.run do |config|
  config.vm.define :box1 do |c|
    bootstrap c, :ip => "192.168.86.101", :hostname => "box1"
  end
end
