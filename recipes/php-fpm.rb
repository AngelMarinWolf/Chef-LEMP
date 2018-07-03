####
# Installation and configuration of PHP-FPM
####
if node[:platform] == 'centos'
  include_recipe 'WordPress::repos_centos'
end
package 'php' do
  action :install
end

package 'PHP requirements' do
  package_name  ['gd','curl']
  action        :install
end

package 'PHP Extensions' do
  package_name  node[:php][:extensions]
  action        :install
end

package 'php-fpm' do
  action :install
end

if node[:platform] == 'centos'
  file '/etc/php-fpm.d/www.conf' do
    action :delete
  end

  template '/etc/php-fpm.d/wordpress.conf' do
    source  "php/wordpress.conf.erb"
    mode    "0644"
    owner   'root'
    group   'root'
  end
end

service 'php-fpm' do
  action [ :enable, :start ]
end
