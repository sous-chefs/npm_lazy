include_recipe 'nodejs' if node['npm_lazy']['server']['install_nodejs']

directory node['npm_lazy']['server']['config']['cacheDirectory']  do
  action :create
  recursive true
end

nodejs_npm 'npm_lazy'

template '/etc/npm_lazy-config.js' do
  source 'npm_lazy-config.js.erb'
end
