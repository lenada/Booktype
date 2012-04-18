include_recipe "postgresql::server"

execute "add_db" do
    cwd "/tmp"
    user "postgres"
    not_if 'sudo su postgres --command "psql --list|grep vagrant -q"'
    command "createdb -T template1 vagrant"
end

bash "assign-postgres-password" do
    user 'postgres'
    code <<-EOH
    echo "CREATE USER vagrant WITH PASSWORD 'vagrant'; GRANT ALL PRIVILEGES ON DATABASE vagrant to vagrant;" | psql
    EOH
    not_if do
        begin
            require 'rubygems'
            Gem.clear_paths
            require 'pg'
            conn = PGconn.connect("localhost", 5432, nil, nil, nil, "vagrant", "vagrant")
            rescue PGError
            false
        end
    end
    action :run
end