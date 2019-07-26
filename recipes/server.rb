#
# Cookbook:: npm_lazy
# Recipe:: server
#
# Copyright:: 2015-2018, Tim Smith - tsmith84@gmail.com
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

template '/etc/npm_lazy-config.js' do
  source 'npm_lazy-config.js.erb'
  notifies :restart, 'service[npm_lazy]'
end

if node['init_package'] == 'systemd'
  systemd_unit 'npm_lazy.service' do
    content(Unit: {
              Description: 'NPM Lazy - A lazy local cache for NPM to make your local deploys faster',
              Documentation: 'https://github.com/mixu/npm_lazy',
              After: 'network.target',
            },
            Service: {
              Type: 'simple',
              Environment: 'HOME=/root',
              ExecStart: '/usr/bin/npm_lazy -c /etc/npm_lazy-config.js',
              Restart: 'on-failure',
            },
            Install: {
              WantedBy: 'multi-user.target',
            })
    action :create
    notifies :restart, 'service[npm_lazy]', :immediately
  end
else # upstart
  cookbook_file 'etc/init/npm_lazy.conf'
end

service 'npm_lazy' do
  supports status: true, restart: true
  action [:enable, :start]
end
