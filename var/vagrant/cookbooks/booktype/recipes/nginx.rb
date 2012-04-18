service "nginx" do
    supports :status => true, :restart => true, :reload => true
    action [ :enable, :start ]
end

execute "delete default vhost" do
    ignore_failure true
    command "rm -f /etc/nginx/sites-enabled/default"
end