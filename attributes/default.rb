#
# Author:: Theofanis Melios
# Cookbook Name:: zf
# Attribute:: default

default['zf']['version'] = '1.12.0'
default['zf']['url'] = "http://packages.zendframework.com/releases/ZendFramework-{zf_version}/ZendFramework-{zf_version}-minimal.tar.gz"
default['zf']['prefix_dir'] = '/var/source'
default['zf']['app_library_dir'] = false