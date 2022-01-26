#
# Cookbook:: Name: percona-hardening
# Recipe: hardening.rb
#
# Copyright:: 2014, Christoph Hartmann
# Copyright:: 2014, Deutsche Telekom AG
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

# protect my.cnf
file node['percona']['main_config_file'] do
  mode '600'
  owner node['percona']['server']['username']
  group 'root'
end

# apply hardening configuration
template node['percona-hardening']['hardening-conf'] do
  owner node['percona-hardening']['user']
  mode '750'
  source 'hardening.cnf.erb'
  notifies :restart, "service[#{node['percona-hardening']['service_name']}]", :immediately
end

# ensure permissions
directory node['percona']['server']['datadir'] do
  mode '755'
  owner node['percona-hardening']['user']
  action :create
end

# need to stub the mysql service for chefspec since it is from a different cookbook
service 'mysql' do
  action :nothing
end if defined?(ChefSpec)
