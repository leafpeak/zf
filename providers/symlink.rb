action :create do
  execute "create zf symlink" do
    not_if do
      ::File.symlink?("#{new_resource.name}/Zend")
    end
    only_if do
      ::File.exists?(new_resource.name)
    end
    command "ln -s #{node['zf']['prefix_dir']}/zendframework/#{node['zf']['version']}/library/Zend #{new_resource.name}"
  end
end

action :delete do
  execute "delete zf symlink" do
    only_if do
      ::File.symlink?("#{new_resource.name}/Zend")
    end
    command "rm #{new_resource.name}/Zend"
  end
end