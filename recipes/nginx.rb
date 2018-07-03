####
# Installation and configuration of Nginx
####
include_recipe 'WordPress::repos_centos'

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode "0644"
  owner 'root'
  group 'root'
  action :create
end

template "/etc/nginx/conf.d/000-upstream.conf" do
  source "000-upstreams.conf.erb"
  mode "0644"
  owner 'root'
  group 'root'
end

template "/etc/nginx/conf.d/000-wordpress.conf" do
  source "000-wordpress.conf.erb"
  mode "0644"
  owner 'root'
  group 'root'
  notifies :reload, "service[nginx]"
end
