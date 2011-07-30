Vagrant::Config.run do |config|
  # web
  config.vm.define :web do |c|
    c.vm.box = "maverick64camp"
    c.vm.network("192.168.86.201")
    c.vm.customize { |v| v.name = "web" }
  end

  # db
  config.vm.define :db do |c|
    c.vm.box = "maverick64camp"
    c.vm.network("192.168.86.202")
    c.vm.customize { |v| v.name = "db" }
  end
end

