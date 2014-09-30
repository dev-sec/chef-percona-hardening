# percona-hardening (Chef cookbook)

## Description

Provides security configurations for [Percona](http://www.percona.com/). It is intended to set up production-ready Percona instances that are configured with minimal surface for attackers.

This cookbook focus security configuration of Percona. It is optimized to be a companion for [percona](https://github.com/phlipper/chef-percona). Therefore you can add this hardening layer on top of your existing Percona configuration in Chef. This cookbook does not replace the existing Percona, but focus on the secure configuration.

We optimized this cookbook to work with [os-hardening](https://github.com/TelekomLabs/chef-os-hardening) and [ssh-hardening](https://github.com/TelekomLabs/chef-ssh-hardening) without a hassle. It will also play well without.

## Requirements

* Opscode chef

## Usage

A sample role may look like:

```json
{
    "name": "percona",
    "default_attributes": { },
    "override_attributes": { },
    "json_class": "Chef::Role",
    "description": "MySql Hardened Server Test Role",
    "chef_type": "role",
    "default_attributes" : {
      "percona" : {
        "server": {
          "jemalloc": true,
          "debian_password": "d3b1an",
          "root_password": "r00t"
        }
      }
    },
    "run_list": [
        "recipe[chef-solo-search]",
        "recipe[apt]",
        "recipe[percona::server]",
        "recipe[percona-hardening]"
    ]
}
```

## Recipes

### percona-hardening::hardening (default)

This recipe is an overlay recipe for the [percona cookbook](https://github.com/phlipper/chef-percona)) and applies `percona-hardening::hardening`

Add the following to your run list and customize security option attributes

```bash
  "recipe[percona::server]",
  "recipe[percona-hardening]"
```

## Security Options

Further information is already available at [Deutsche Telekom (German)](http://www.telekom.com/static/-/155996/7/technische-sicherheitsanforderungen-si) and [Symantec](http://www.symantec.com/connect/articles/securing-mysql-step-step) 

 * default['percona']['security']['chroot'] - [chroot](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_chroot)
 * default['percona']['security']['safe_user_create'] - [safe-user-create](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_safe-user-create)
 * default['percona']['security']['secure_auth'] - [secure-auth](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-auth)
 * default['percona']['security']['skip_symbolic_links'] - [skip-symbolic-links](http://dev.mysql.com/doc/refman/5.7/en/server-
    options.html#option_mysqld_symbolic-links)
 * default['percona']['security']['skip_show_database'] - [skip-show-database](http://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_skip-show-database)
 * default['percona']['security']['local_infile'] - [local-infile](http://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_local_infile)
 * default['percona']['security']['allow-suspicious-udfs'] - [allow-suspicious-udfs](https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_allow-suspicious-udfs)
 * default['percona']['security']['automatic_sp_privileges'] - [automatic_sp_privileges](https://dev.mysql.com/doc/refman/5.7/en/server-system-variables.html#sysvar_automatic_sp_privileges)
 * default['percona']['security']['secure-file-priv'] - [secure-file-priv](https://dev.mysql.com/doc/refman/5.7/en/server-options.html#option_mysqld_secure-file-priv)

## Security Configuration

This setup sets the following parameters by default

    user = mysql
    port = 3306
    bind-address = X.Y.Z.W

    # via ['mysql']['security']['local_infile']
    local-infile = 0

    # via ['mysql']['security']['safe_user_create']
    safe-user-create = 1

    # via ['mysql']['security']['secure_auth']
    secure-auth = 1

    # via ['mysql']['security']['skip_show_database']
    skip-show-database

    # via ['mysql']['security']['skip_symbolic_links']
    skip-symbolic-links

    # via ['mysql']['security']['automatic_sp_privileges']
    automatic_sp_privileges = 0

    # via ['mysql']['security']['secure-file-priv']
    secure-file-priv = /tmp


## Tests

```bash
# Install dependencies
gem install bundler
bundle install

# Do lint checks
bundle exec rake lint

# Fetch tests
bundle exec thor kitchen:fetch-remote-tests

# fast test on one machine
bundle exec kitchen test default-ubuntu-1204

# test on all machines
bundle exec kitchen test

# for development
bundle exec kitchen create default-ubuntu-1204
bundle exec kitchen converge default-ubuntu-1204
```

This cookbook comes with a [guard](https://github.com/guard/guard) file for easy development. During development guard watches the folders and runs footcritic and robocop.

```
# list all plugins
bundle exec guard list

# run guard with foodcritic and robocop
bundle exec guard -P Foodcritic Rubocop
```

## Tested Operating Systems

* Ubuntu 12.04
* Ubuntu 14.04
* CentOS 6.4
* CentOS 6.5
* Oracle 6.4
* Oracle 6.5
* Debain 7

## Contributors + Kudos

* Dominik Richter
* Christoph Hartmann
* Patrick Meier
* Edmund Haselwanter

## License and Author

* Author:: Deutsche Telekom AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
