####
# Installation and configuration of PHP-FPM
####

# Importing Repositories
if node[:platform] == 'centos'
  include_recipe 'WordPress::repos_centos'
end

# Installing PHP
package 'php' do
  action :install
end

# Installing requirements
package 'PHP requirements' do
  package_name  ['gd','curl']
  action        :install
end

# Installing dependecies
package 'PHP Extensions' do
  package_name  node[:php][:extensions]
  action        :install
end

# Installing PHP-FPM
package 'php-fpm' do
  action :install
end

# Replacing default configuration files
if node[:platform] == 'centos'
  file '/etc/php-fpm.d/www.conf' do
    action :delete
  end

  # Creating php-fpm pool
  template '/etc/php-fpm.d/www.conf' do
    source  "php/www.conf.erb"
    mode    "0644"
    owner   'root'
    group   'root'
  end
end

# Starting and enabling Service
service 'php-fpm' do
  action [ :enable, :start ]
end
