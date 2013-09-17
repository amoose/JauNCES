set :user, "ubuntu"
# set :branch, 'update_seed_filemodes'
set :rails_env, "production"
server "nces.tynsax.com", :app, :web, :db, :primary => true