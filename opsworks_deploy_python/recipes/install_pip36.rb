#
# Cookbook Name:: opsworks_deploy_python
# Recipe:: install_pip36
#
require 'chef/log'
Chef::Log.level = :debug

node[:deploy].each do |application, deploy|
    script "update-security-group" do
        interpreter "bash"
        user "root"
        environment node['deploy']['mc']['environment']
        code <<-EOH
           sudo add-apt-repository -y ppa:deadsnakes/ppa
           sudo apt-get update
           sudo apt-get install -y python3.6
           sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
           wget https://bootstrap.pypa.io/get-pip.py -O - | sudo python3
           curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python3.6 && sudo python3.6 -m easy_install pip
        EOH
    end
end