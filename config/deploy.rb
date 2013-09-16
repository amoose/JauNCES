set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'
set :application, "jaunces"
set :repository, "git@github.com:GSA-OCSIT/jaunces.git"
set :scm, :git
set :use_sudo, true
set :user, 'ubuntu'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :rvm_ruby_string, 'ruby-2.0.0-p247'
set :git_shallow_clone, 1
set :keep_releases, 5

set :shared_path, "/var/www/#{application}-shared"

set :deploy_to, "/var/www/#{application}"

set :deploy_via, :copy

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "copies shared config to app config"
	task :symlink_config do
		run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
	end

	desc "creates asset dirs"
	task :create_asset_dirs do
		run "mkdir -p #{release_path}/public/images"
		run "mkdir -p #{release_path}/public/stylesheets"
		run "mkdir -p #{release_path}/public/javascripts"
	end
end



before "deploy:finalize_update", "deploy:create_asset_dirs"
after "deploy:finalize_update", "deploy:symlink_config"
after "deploy:finalize_update", "deploy:cleanup"
