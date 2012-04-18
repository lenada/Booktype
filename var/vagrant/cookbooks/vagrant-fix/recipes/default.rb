# for some reason, most VMs fail with outdated package lists
execute "update package index" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end.run_action(:run)

#gem_package "apt-repair-sources" do
#  options "--no-rdoc --no-ri"
#  action :install
#end.run_action(:install)
#
#execute "test-sources" do
#  command "apt-repair-sources"
#end
