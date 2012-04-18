# run preparation
execute "prepare_things" do
    cwd "/vagrant_data/scripts"
    user "vagrant"
    command "./createbooki --database postgresql /vagrant_data/var/www/mybooktype/"
    ignore_failure true
end

execute "link nginx conf" do
    command "sudo ln -s /vagrant_data/var/www/mybooktype/gunicorn.nginx /etc/nginx/sites-enabled/mybooktype.conf"
    not_if "test -L /etc/nginx/sites-enabled/mybooktype.conf"
end

execute "delete default vhost" do
    ignore_failure true
    command "rm -f /etc/nginx/sites-enabled/default"
end

# test

execute "prepare_things" do
    cwd "/vagrant_data/var/www/mybooktype/"
    user "vagrant"
    command "./createbooki --database postgresql /vagrant_data/var/www/mybooktype/"
    ignore_failure true
end

execute "check_things" do
    ignore_failure true
    cwd "/vagrant_data/scripts"
    user "vagrant"
    command "./createbooki --check-versions --database sqlite /vagrant_data/var/www/mybooktype/"
end

#execute "create-database" do
#    user "postgres"
#    command "createdb -U postgres -O vagrant mybooktype"
#end

service "nginx" do
    service_name "nginx"
    supports [ :start, :status, :restart ]
    action :restart
end



execute "booktype_hopeitruns" do
    cwd "/vagrant_data/var/www/mybooktype/"
    user "vagrant"
    command ". ./booki.env"
    command "django-admin.py syncdb --noinput"
    command "django-admin.py migrate"
    command "/usr/local/bin/django-admin.py runserver &"
    #command "django-admin.py createsuperuser"
    ignore_failure true
end

