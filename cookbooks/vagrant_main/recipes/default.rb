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

unless node[:hostname] == node[:my_hostname]
  execute "change hostname" do
    command "hostname #{node[:my_hostname]}"
    action :run
  end
end
__END__
cron "noop" do
  hour "5"; minute "0"
  command "/bin/true"
end
