source 'https://rubygems.org'

gem 'berkshelf',  '~> 5.0'
gem 'chef',       '~> 12.14'

group :test do
  gem 'chefspec', '~> 5.0'
  gem 'coveralls', require: false
  gem 'foodcritic', '~> 6.3'
  gem 'rake'
  gem 'rubocop', '~> 0.43.0'
  gem 'thor-foodcritic'
  gem 'simplecov', '~> 0.10'
end

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
