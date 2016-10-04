# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf',  '~> 5.0'
gem 'chef',       '~> 12.14'
gem 'chefspec',   '~> 5.0'
gem 'foodcritic', '~> 6.3'
gem 'thor-foodcritic'
gem 'rake'
gem 'rubocop', '~> 0.43'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  # gem 'guard-kitchen' # guard-kitchen is not compatable with Guard 2.x
  gem 'guard-rubocop'
  gem 'guard-foodcritic'
end

group :integration do
  gem 'test-kitchen', '~> 1.0'
  gem 'kitchen-vagrant'
  gem 'kitchen-sharedtests', '~> 0.2.0'
end

group :openstack do
  gem 'kitchen-openstack'
end
