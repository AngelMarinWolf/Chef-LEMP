#
# Repositories for Centos 7
#
# This recipe contain the next Repositories:
#     - EPEL
#     - REMI
#     - NGINX

####
# NGINX Repository
####
yum_repository 'nginx-repo' do
  description "Nginx.org Repository"
  baseurl     "https://nginx.org/packages/#{ node[:platform] }/#{node[:platform_version].to_i}/$basearch/"
  gpgkey      "https://nginx.org/keys/nginx_signing.key"
  enabled     true
  action      :create
end

####
# EPEL Repository
####
yum_repository 'epel-release' do
  case node[:platform_version].to_i
  when 7
    description "Extra Packages for Enterprise Linux (or EPEL)"
    mirrorlist  "https://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node[:platform_version].to_i}&arch=#{node[:kernel][:machine]}"
    gpgkey      "https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-#{node[:platform_version].to_i}"
    enabled     true
    action      :create
  when 6
    description "Extra Packages for Enterprise Linux (or EPEL)"
    baseurl     "https://mirrors.fedoraproject.org/mirrorlist?repo=epel-#{node[:platform_version].to_i}&arch=#{node[:kernel][:machine]}"
    gpgkey      "https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-#{node[:platform_version].to_i}"
    enabled     true
    action      :create
  end
end

####
# REMI Repository
####
yum_repository 'remi-php' do
  case node[:platform_version].to_i
  when 7
    description "Providing the latest versions of the PHP stack"
    baseurl     "http://rpms.remirepo.net/enterprise/#{node[:platform_version].to_i}/safe/#{node[:kernel][:machine]}/"
    gpgkey      ["https://rpms.remirepo.net/RPM-GPG-KEY-remi","https://rpms.remirepo.net/RPM-GPG-KEY-remi2017","https://rpms.remirepo.net/RPM-GPG-KEY-remi2018"]
    enabled     true
    action      :create
  when 6
    description "Providing the latest versions of the PHP stack"
    baseurl     "http://rpms.remirepo.net/enterprise/#{node[:platform_version].to_i}/safe/#{node[:kernel][:machine]}/"
    gpgkey      ["https://rpms.remirepo.net/RPM-GPG-KEY-remi","https://rpms.remirepo.net/RPM-GPG-KEY-remi2017","https://rpms.remirepo.net/RPM-GPG-KEY-remi2018"]
    enabled     true
    action      :create
  end
end
