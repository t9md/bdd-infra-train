module Snap
	class Command < Vagrant::Command::GroupBase
	  register "sample","sample command"

	  desc "go [SNAPNAME]", "go to specified snapshot"
	  def go(snapshot_name)
      @vagrant_env=Vagrant::Environment.new
      @vagrant_env.vms.each do |e|
        require "pp"
        pp e
      end
      # instance_name="#{@vagrant_env.vms[:default].vm}"
      # p instance_name

      # code here
	  end

	  desc "back", "back to current snapshot"
	  def back
      # sh "VBoxManage controlvm #{env.VM} poweroff"
      # sh "VBoxManage snapshot  #{env.VM} restorecurrent"
      # sh "VBoxManage startvm   #{env.VM} --type headless"
	  end

	  desc "take", "take snapshot"
	  def take
      # code here
	  end
	end
end
