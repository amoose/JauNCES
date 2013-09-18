set :user, "ubuntu"
set :branch, 'prod_mvp'
set :rails_env, "production"
server "nces.tynsax.com", :app, :web, :db, :primary => true