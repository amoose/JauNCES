source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'mongoid', '~> 4', :github=>'mongoid/mongoid'   # must be listed before geocoder

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.0.0'
gem 'figaro'
gem 'geocoder'
gem 'httparty'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'json'
gem 'redis'
gem 'resque', '~> 2.0.0.pre.1', github: 'resque/resque'
gem 'roo'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form', '>= 3.0.0.rc'
gem 'slim'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'zip'

group :development do
  # this has dependency conflicts with pry/pry-nav
  # gem 'better_errors' 
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'capistrano-rails'
  gem 'haml-rails'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rvm-capistrano'
end

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'thin'
  gem 'pry'
  gem 'pry-nav'
end

group :production do
  gem 'redis-store'
  gem 'redis-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'mongoid-rspec', '>= 1.6.0', :github=>"evansagge/mongoid-rspec"
end