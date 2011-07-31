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

execute "set_default_route" do
  command "ip route delete default ; ip route add default via #{node[:my_gateway]}"
  not_if "ip route  | grep -v grep | grep ^default | grep #{node[:my_gateway]}"
  action :run
end

unless node[:hostname] == node[:my_hostname]
  execute "change hostname" do
    command "hostname #{node[:my_hostname]}"
    action :run
  end
end

service "hostname" do
  action [:enable, :start]
end

template "/etc/hostname" do
  source "hostname.erb"
  notifies :run, resources(:service => "hostname")
end

template "/etc/hosts" do
  source "hosts.erb"
end
