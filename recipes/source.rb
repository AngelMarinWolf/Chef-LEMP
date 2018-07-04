
package 'git' do
  action :install
end

directory node[:source][:path_dir] do
  owner     'root'
  group     'root'
  mode      '0755'
  recursive true
  action    :create
end

git node[:source][:path_dir] do
  repository  node[:source][:repository]
  revision    node[:source][:revision]
  action      :sync
end
