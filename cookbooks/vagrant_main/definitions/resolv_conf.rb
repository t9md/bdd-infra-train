define :resolv_conf, :nameservers => ['127.0.0.1'], :domain => "local", :search => nil do
  template "/tmp/resolv.conf" do
    owner "root"
    group "root"
    mode 0644
    source "resolv.conf.erb"
    variables(
      :nameservers => params[:nameservers],
      :domain => params[:domain],
      :search => params[:search].nil? ? params[:domain] : params[:search]
    )
  end
end
