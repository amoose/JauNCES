set :user, "ubuntu"
# set :branch, 'update_seed_filemodes'
set :rails_env, "production"
server "nces.resapi.org", :app, :web, :db, :primary => true