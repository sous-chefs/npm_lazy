#
# Cookbook:: npm_lazy
# Recipe:: client
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

include_recipe 'nodejs' if node['npm_lazy']['client']['install_nodejs']

####
#### Note at the moment this only sets the npm registry for the root user
####

# set the npm registry if it's not already set
execute 'set npm registry' do
  command "npm config set registry #{node['npm_lazy']['client']['registry_uri']} --global"
  not_if "npm config list --global | grep #{node['npm_lazy']['client']['registry_uri']}"
  action :run
end
