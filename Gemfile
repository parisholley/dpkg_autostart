source 'https://rubygems.org'

gem 'rake'
gem 'berkshelf', '~> 2.0.14' # Needed for both test and integration

group :test do
  gem 'chefspec', '~> 3.4.0'
  gem 'foodcritic', '~> 3.0.3'
  gem 'rubocop', '~> 0.20.0'
end

group :integration do
  gem 'busser-serverspec', '~> 0.2.6'
  gem 'kitchen-vagrant', '~> 0.13'
  gem 'test-kitchen', '~> 1.1'
end
