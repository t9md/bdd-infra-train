$firsttime = ! File.exist?(".vagrant")
def bootstrap(config, opt)
  config.vm.box = "lucid64"
  config.vm.network opt[:ip]
  config.vm.customize do |v|
    v.name = opt[:hostname]
    v.memory_size = 1024
  end
  config.vm.provision :chef_solo do |chef|
    if $firsttime
      chef.run_list = [
        "recipe[dummy]",
      ]
    else
      chef.run_list = [
        "recipe[vagrant_main]",
      ]
    end
    chef.cookbooks_path = "cookbooks"
    chef.json = {
      :my_hostname => opt[:hostname],
      :my_domain   => "example.com",
      :my_gateway  => "192.168.86.1",
      :hosts_ent   => [
        "192.168.86.103 box3.example.com box3",
        "192.168.86.104 box4.example.com box4",
      ],
      :ssh_pubkey  => File.read(File.expand_path("~/.ssh/id_rsa.pub"))
    }
  end
end

Vagrant::Config.run do |conf|
  conf.vm.define(:box3) { |c| bootstrap c, :ip => "192.168.86.103", :hostname => "box3" }
  conf.vm.define(:box4) { |c| bootstrap c, :ip => "192.168.86.104", :hostname => "box4" }
end
