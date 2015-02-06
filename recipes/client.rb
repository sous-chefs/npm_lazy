# set the npm registry if it's not already set
execute 'set npm registry' do
  command "npm config set registry #{node['npm_lazy']['client']['registry_uri']}"
  not_if "npm config list | grep #{node['npm_lazy']['client']['registry_uri']}"
  action :run
end
