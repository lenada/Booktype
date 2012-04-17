# run preparation
execute "prepare_things" do
    cwd "/vagrant_data/scripts"
    user "vagrant"
    command "./createbooki --database postgresql /vagrant_data/var/www/mybooktype/"
end

# test

#execute "check_things" do
#    cwd "/vagrant_data/scripts"
#    user "vagrant"
#    command "./createbooki --check-versions --database sqlite /vagrant_data/var/www/mybooktype/"
#end

execute "create-database" do
    user "postgres"
    command "createdb -U postgres -O vagrant mybooktype"
end


execute "booktype_hopeitruns" do
    cwd "/vagrant_data/var/www/mybooktype/"
    user "vagrant"
    command ". ./booki.env"
    command "django-admin.py syncdb --noinput"
    command "django-admin.py migrate"
    command "django-admin.py createsuperuser"
    
end
