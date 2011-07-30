def env
  require "rubygems"
  require "vagrant"
  @_env ||= Vagrant::Environment.new
end

def tmux_send_keys(cmds, clear = true)
  system "tmux send-keys 'clear' Enter" if clear
  cmds.split("\n").each do |cmd|
    system "tmux send-keys '#{cmd}' Enter"
  end
end

namespace :snap do
  desc "list"
  task :list do
    tmux_send_keys "vagrant snap list"
  end

  desc "take"
  task :take do
    tmux_send_keys "vagrant snap take"
  end

  desc "back"
  task :back do
    tmux_send_keys "vagrant snap back"
  end
end

desc "up"
task :up do
  tmux_send_keys "vagrant up"
end

# desc "destroy"
task :destroy do
  tmux_send_keys "vagrant destroy"
end

desc "provision"
task :provision do
  tmux_send_keys "vagrant provision"
  # Rake::Task[:test].invoke
end

# task :_test do
  # env.primary_vm.ssh.execute do |ssh|
    # # puts "=== Crontab"
    # # puts ssh.exec!("sudo crontab -l")
    # # puts "=== hostname"
    # # puts ssh.exec!("hostname")
    # puts "=== ntp"
    # puts ssh.exec!("sudo ntpq -pn")
    # puts "=== resolver"
    # puts ssh.exec!("sudo cat /etc/resolv.conf")
  # end
# end
#

def shell(header, cmds)
  puts "==== #{header}".green.bold
  STDOUT.flush
  cmds.split(/\n/).each do |cmd|
    puts "# #{cmd.lstrip}".yellow
    sh( cmd ,:verbose => false ) do |ok, res|
      if ! ok
        puts "fail (status = #{res.exitstatus})".red.bold
      end
    end
  end
end

task :_test do
  require "colored"
  shell "hostname", <<-EOS
    ls
    hostname
  EOS

  shell "crontab", <<-EOS
    sudo crontab -l
  EOS
  shell "ntp", <<-EOS
  sudo ntpq -pn
  EOS
  shell "resolve.conf", <<-EOS
  cat /etc/resolv.conf
  EOS
end

desc "test"
task :test do
  tmux_send_keys "vagrant rake _test" , false
end
