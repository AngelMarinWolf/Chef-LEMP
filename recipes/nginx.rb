####
# Installation and configuration of Nginx
####

# Importing Repositories
if node[:platform] == 'centos'
  include_recipe 'WordPress::repos_centos'
end

# Installing Software
package 'nginx' do
  action :install
end

# Starting Service
service 'nginx' do
  action [ :enable, :start ]
end

# Replacing default configuration file
cookbook_file "/etc/nginx/nginx.conf" do
  source  "nginx.conf"
  mode    "0644"
  owner   'root'
  group   'root'
  action  :create
end

# Creating Upstreams File
template "/etc/nginx/conf.d/000-upstream.conf" do
  source  "nginx/000-upstreams.conf.erb"
  mode    "0644"
  owner   'root'
  group   'root'
end

# Creating WordPress Server Block
template "/etc/nginx/conf.d/000-app.conf" do
  source  "nginx/000-app.conf.erb"
  mode    "0644"
  owner   'root'
  group   'root'
  notifies :reload, "service[nginx]"
end
