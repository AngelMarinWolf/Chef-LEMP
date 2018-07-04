####
# Installation and configuration of MySQL
####

# Importing Repositories
if node[:platform] == 'centos'
  include_recipe 'LEMP-Centos::repos_centos'
end

# Installing Software
package 'MySQL Server' do
  package_name   ['mysql-community-client','mysql-community-server']
  action         :install
end

# Starting Service
service 'mysqld' do
  action [ :enable, :start ]
end
