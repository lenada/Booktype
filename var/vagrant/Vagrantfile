Vagrant::Config.run do |config|
  config.vm.box = "base"

  config.vm.boot_mode = :gui

  config.vm.network :hostonly, "33.33.33.126"

  config.ssh.max_tries = 100

  config.vm.customize [
    "modifyvm", :id,
    "--name", "BooktypeVM",
    "--memory", "1024"
  ]

  # nginx
  config.vm.forward_port 80, 8000
  config.vm.forward_port 8000, 8080

  config.vm.share_folder "v-data", "/vagrant_data", "../../"#, {:nfs => true}

  config.vm.provision :chef_solo do |chef|
    #chef.data_bags_path = "./data-bags"
	chef.cookbooks_path = "./cookbooks"
    chef.add_recipe "vagrant-fix::default"
    chef.add_recipe "nginx::default"
    chef.add_recipe "python::package"
	chef.add_recipe "booktype::pip"
	chef.add_recipe "booktype::django"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "booktype::postgres"
    chef.add_recipe "booktype::booktype"
    chef.log_level = :debug
  end

end
