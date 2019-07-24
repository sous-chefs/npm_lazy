# Cookbook:: npm_lazy
# Attributes:: client
#
# Copyright:: 2015-2018, Tim Smith - tsmith84@gmail.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['npm_lazy']['server']['install_nodejs'] = true
default['npm_lazy']['server']['config']['cacheDirectory'] = '/srv/npm_lazy/db'
default['npm_lazy']['server']['config']['logPath'] = '/var/log/npm_lazy.log'
default['npm_lazy']['server']['config']['cacheAge'] = '0'
default['npm_lazy']['server']['config']['httpTimeout'] = 5000
default['npm_lazy']['server']['config']['maxRetries'] = 5
default['npm_lazy']['server']['config']['rejectUnauthorized'] = 'true'
default['npm_lazy']['server']['config']['externalUrl'] = 'http://localhost:8080'
default['npm_lazy']['server']['config']['remoteUrl'] = 'https://registry.npmjs.org/'
default['npm_lazy']['server']['config']['port'] = '8080'
default['npm_lazy']['server']['config']['host'] = 'localhost'
