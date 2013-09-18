set :user, "ubuntu"
set :branch, 'prod_mvp'
set :rails_env, "production"
# server "nces.tynsax.com", :app, :web, :db, :primary => true
server "ec2-54-211-57-112.compute-1.amazonaws.com", :app, :web, :db, :primary => true