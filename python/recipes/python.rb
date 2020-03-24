apt_repository "python3" do
    uri 'http://ppa.launchpad.net/deadsnakes/ppa/ubuntu'
    components ['trusty main']
end


execute "update" do
    command 'sudo apt-get update'
end

package 'python3.6' do
    options '--force-yes'
    command 'sudo add-apt-repository -y ppa:deadsnakes/ppa'
	command 'sudo apt-get update & sudo apt-get install -y python3.6'
	command 'sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1'
	command 'wget https://bootstrap.pypa.io/get-pip.py -O - | sudo python3'
	command 'sudo curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python3.6 && sudo python3.6 -m easy_install pip'
end

package 'python3.6-dev' do
    options '--force-yes'
    action :install
end

alternatives 'python-set-version-3' do
    link_name 'python3'
    path '/usr/bin/python3.6'
    priority 100
    action :install
end