# for some reason, most VMs fail with outdated package lists
execute "apt-get update" do
  user "root"
  command "sudo apt-get -y -f -q update"
end

#gem_package "apt-repair-sources" do
#  options "--no-rdoc --no-ri"
#  action :install
#end.run_action(:install)
#
#execute "test-sources" do
#  command "apt-repair-sources"
#end
