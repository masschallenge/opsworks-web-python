group "create deploy sudo" do
  group_name 'sudo'
  members 'deploy'
  action :modify
  append true
end