source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2'

gem 'mongoid', github: 'mongodb/mongoid', tag: 'v5.1.1' # must be listed before geocoder
gem 'bootstrap-sass', '~> 3.3.1'
gem 'sass-rails', '>= 3.2'
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
gem 'simple_form', '>= 3.0.0.rc'
gem 'slim'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'zip'
gem 'rake', '~> 10'
gem 'us_web_design_standards'

group :development do
  # this has dependency conflicts with pry/pry-nav
  # gem 'better_errors' 
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :rbx]
  # gem 'capistrano', '~> 3.1'
  # gem 'capistrano-rails', '~> 1.1'
  gem 'haml-rails'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'hub', require: nil
  gem 'quiet_assets'
  # gem 'rvm-capistrano'
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
  gem 'rubocop'
  gem 'go_script'
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
  gem 'mongoid-rspec', '>= 1.6.0', github: 'evansagge/mongoid-rspec'
end
