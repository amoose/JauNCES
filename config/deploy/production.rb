set :user, "ubuntu"
set :rails_env, "production"
server "nces.resapi.org", :app, :web, :db, :primary => true
