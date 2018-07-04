####
# Installation and configuration of MySQL
####

# Importing Repositories
if node[:platform] == 'centos'
  include_recipe 'WordPress::repos_centos'
end

# Installing Software
package 'MySQL Server' do
  package_name   ['mysql-community-client','mysql-community-server']
  action         :install
end

# Starting Service
service 'mysql' do
  action [ :enable, :start ]
end
