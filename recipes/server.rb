#
# Cookbook Name:: npm_lazy
# Recipe:: server
#
# Copyright 2015, Tim Smith - tsmith84@gmail.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nodejs' if node['npm_lazy']['server']['install_nodejs']

directory node['npm_lazy']['server']['config']['cacheDirectory'] do
  action :create
  recursive true
end

nodejs_npm 'npm_lazy'

cookbook_file 'etc/init/npm_lazy.conf'

service 'npm_lazy' do
  supports status: true, restart: true
  action [:enable, :start]
  provider Chef::Provider::Service::Upstart
end

template '/etc/npm_lazy-config.js' do
  source 'npm_lazy-config.js.erb'
  notifies :restart, 'service[npm_lazy]', :immediately
end
