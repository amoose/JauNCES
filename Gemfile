source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'bootstrap-sass'
gem 'coffee-rails', '~> 4.0.0'
gem 'figaro'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'json'
gem 'mongoid', '~> 4', :github=>"mongoid/mongoid"
gem "resque", "~> 2.0.0.pre.1", github: "resque/resque"
gem 'roo'
gem 'sass-rails', '~> 4.0.0'
gem 'simple_form', '>= 3.0.0.rc'
gem 'slim'
gem 'turbolinks'
gem 'uglifier', '>= 1.3.0'
gem 'zip'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'haml-rails'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end

group :development, :test do
  gem 'fabrication'
  gem 'rspec-rails'
  gem 'thin'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'mongoid-rspec', '>= 1.6.0', :github=>"evansagge/mongoid-rspec"
end