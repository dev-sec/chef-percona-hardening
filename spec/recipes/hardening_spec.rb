#
# Copyright:: 2016, Grant Ridder
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

require 'spec_helper'

describe 'percona-hardening::hardening' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
  end

  it 'create /etc/mysql/my.cnf file' do
    expect(chef_run).to create_file('/etc/mysql/my.cnf').with(
      mode: '600',
      owner: 'mysql',
      group: 'root'
    )
  end

  it 'create /etc/mysql/conf.d/hardening.cnf template' do
    expect(chef_run).to create_template('/etc/mysql/conf.d/hardening.cnf').with(
      owner: 'mysql',
      mode: '750',
      source: 'hardening.cnf.erb'
    )
    resource = chef_run.template('/etc/mysql/conf.d/hardening.cnf')
    expect(resource).to notify('service[mysql]').to(:restart).immediately
  end

  it 'create /var/lib/mysql directory' do
    expect(chef_run).to create_directory('/var/lib/mysql').with(
      owner: 'mysql',
      mode: '755'
    )
  end

  it 'stubbing mysql service for chefspec' do
    expect(chef_run).to_not enable_service('mysql')
  end

  context 'chef-solo' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
    end

    it 'does not raise an error' do
      expect { chef_run }.not_to raise_error
    end
  end
end
