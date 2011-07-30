def env
  require "rubygems"
  require "vagrant"
  @_env ||= Vagrant::Environment.new
end

def tmux_send_keys(cmds, clear = true)
  system "tmux send-keys 'clear' Enter" if clear
  cmds.split("\n").each do |cmd|
    system %!tmux send-keys "#{cmd}" Enter!
  end
end

def Sh(cmd)
  if ENV['VIM']
    tmux_send_keys cmd.gsub("'", "\'")
  else
    sh cmd
  end
end

namespace :snap do
  desc "list"
  task :list do
    Sh "vagrant snap list"
  end

  desc "take"
  task :take do
    Sh "vagrant snap take"
  end

  desc "back"
  task :back do
    Sh "vagrant snap back"
  end
end

desc "up"
task :up do
  Sh "vagrant up"
end

# desc "destroy"
task :destroy do
  Sh "vagrant destroy"
end

desc "provision"
task :provision do
  Sh "vagrant provision"
end

desc "test"
task :test do
  Sh "ssh root@box1 'cd /vagrant/rake; rake test'"
end
