include_recipe "apt"

%w(libxml2 libxml2-dev libxslt1-dev).each do  |pkg|
  package pkg do 
    action :install
  end
end

%w(rake colored cucumber-nagios).each do |pkg|
  gem_package pkg do
    action :install
  end
end

directory "/root/.ssh" do
  owner "root"
  group "root"
  mode "0600"
  action :create
end

file "/root/.ssh/authorized_keys" do
  owner "root"
  group "root"
  mode "0644"
  content node[:ssh_pubkey]
  action :create_if_missing
end

file "/tmp/testfile" do
  owner "vagrant"
  group "root"
  mode "0644"
  content "hoge
  hoge
  hoge"
end

unless node[:hostname] == node[:my_hostname]
  execute "change hostname" do
    command "hostname #{node[:my_hostname]}"
    action :run
  end
end

# add repository source to local
# template "/etc/apt/sources.list" do
  # owner "root"
  # group "root"
  # mode "0644"
  # source "sources.list.erb"
# end

# openstack
# apt_repository "openstack" do
  # uri "http://172.27.98.16/cloud/latest/openstack/nova-core/release/ubuntu"
  # distribution node['lsb']['codename']
  # components ["main"]
  # # keyserver "keyserver.ubuntu.com"
  # # key "C300EE8C"
  # action :add
# end


cron "noop" do
  hour "5"; minute "0"
  command "/bin/true"
end

MY_NAME="TAKU Maeda This is my new name #{Time.now}"
execute "HOGHEOGE" do
  command "echo #{MY_NAME} >>/tmp/result"
  creates "/tmp/result"
  action :run
end

# package "git-core" do
  # action :install
# end
# package "lv" do
  # action :install
# end
# add the Nginx PPA; grab key from keyserver
# apt_repository "nginx-php" do
  # uri "http://ppa.launchpad.net/nginx/php5/ubuntu"
  # distribution node['lsb']['codename']
  # components ["main"]
  # keyserver "keyserver.ubuntu.com"
  # key "C300EE8C"
  # action :add
# end

# apt_repository "nginx-php" do
  # uri "http://ppa.launchpad.net/nginx/php5/ubuntu"
  # distribution "#{node[:lsb][:codename]}"
  # components %w(main restricted universe multiverse)
# end

__END__
# lucid
deb http://172.27.98.16/cloud/latest/ubuntu lucid main restricted universe multiverse
deb http://172.27.98.16/cloud/latest/ubuntu lucid-updates main restricted universe multiverse
deb http://172.27.98.16/cloud/latest/ubuntu lucid-security main restricted universe multiverse

# openstack
deb http://172.27.98.16/cloud/latest/openstack/nova-core/release/ubuntu lucid main

__END__
require "rubygems"
require "colored"
def info(&blk) log("#{blk.call.to_s}".magenta){ level :info } end
def fatal(&blk) log("#{blk.call.to_s}".red){ level :fatal } end
# :info, :warn, :debug, :error, or :fatal
info { "#{node.cpu[:total]}" }
fatal { "#{node.cpu[:total]}" }
fatal { "HOGEHOGE" }
info { packages.inspect }
