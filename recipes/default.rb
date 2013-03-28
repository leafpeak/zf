#
# Cookbook Name:: zf
# Recipe:: default
#

zf_version = node['zf']['version']
source = "#{node['zf']['prefix_dir']}/zendframework"
source_url = node['zf']['url'].gsub '{zf_version}', zf_version

remote_file "#{Chef::Config[:file_cache_path]}/zf-#{zf_version}.tar.gz" do
  source source_url
  mode '0644'
  not_if { File.exists?("#{Chef::Config[:file_cache_path]}/zf-#{zf_version}.tar.gz") }
end

directory source do
  owner 'root'
  group 'root'
  mode '0655'
  recursive true
  not_if { File.directory?(source) }
end

bash "untar zf" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
  tar -zxvf #{Chef::Config[:file_cache_path]}/zf-#{zf_version}.tar.gz -C #{source}
  mv #{source}/ZendFramework-#{zf_version}-minimal #{source}/#{zf_version}
  EOF
  not_if { File.directory?("#{source}/#{zf_version}") }
end