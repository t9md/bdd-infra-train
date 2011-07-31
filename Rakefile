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
  task(:list) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }
  desc "take"
  task(:take) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }
  desc "back"
  task(:back) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }
end

desc "up"
task(:up) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }
#desc "destroy"
task(:destroy) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }
desc "provision"
task(:provision) { |t| Sh "vagrant #{t.name.sub(':',' ')}" }

namespace :knife do
  namespace :bootstrap do
    desc "box3"
    task(:box3) do |t|
      role = %w(role[production] role[nagios_base] role[monitoring])
      Sh "#{t.name.gsub(':',' ')} -r '#{role.join(",")}'"
    end
    desc "box4"
    task(:box4) do |t|
      role = %w(role[production] role[nagios_base])
      Sh "#{t.name.gsub(':',' ')} -r '#{role.join(",")}'"
    end
  end
end

namespace :in do
  desc "test"
  task :test do
    Sh "ssh root@box1 'cd /vagrant; rake in:box:test'"
  end
  namespace :box do
    task :test do
      Sh "cucumber -c features/file.feature"
    end
  end
end

namespace :out do
  desc "test"
  task :test do
    Sh "cucumber -c features/ssh.feature"
  end
end

