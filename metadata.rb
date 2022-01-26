#
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

name             'percona-hardening'
maintainer       'Christoph Hartmann'
maintainer_email 'chris@lollyrock.com'
license          'Apache-2.0'
description      'Installs and configures a secure percona server'
version          '1.0.0'

depends 'percona', '>= 0.15.5'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'redhat'
supports 'ubuntu'

source_url 'https://github.com/dev-sec/chef-percona-hardening'
issues_url 'https://github.com/dev-sec/chef-percona-hardening/issues'
