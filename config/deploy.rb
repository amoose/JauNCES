require 'capistrano/ext/multistage'
require "rvm/capistrano"

set :stages, %w(production)
set :default_stage, "production"
set :application, "jaunces"
set :repository, "git@github.com:infamousamos/jaunces.git"
set :scm, :git
set :use_sudo, true
set :user, 'ubuntu'
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :rvm_ruby_string, 'ruby-2.0.0-p247@nces-lookup'
set :git_shallow_clone, 1
set :keep_releases, 5

set :shared_path, "/var/www/shared"

set :rvm_type, :user

set :deploy_to, "/var/www/#{application}"

# set :deploy_via, :copy

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "copies shared config to app config"
	task :symlink_config do
		run "ln -nfs #{shared_path}/config/redis/#{rails_env}.conf #{release_path}/config/redis/#{rails_env}.conf"
		run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
	end

	desc "creates asset dirs"
	task :create_asset_dirs do
		run "mkdir -p #{release_path}/public/images"
		run "mkdir -p #{release_path}/public/stylesheets"
		run "mkdir -p #{release_path}/public/javascripts"
	end

	desc "precompiles assets"
	task :precompile_assets do
		run "RAILS_ENV=#{rails_env} cd #{current_path} && rake assets:precompile"
	end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end



before "deploy:finalize_update", "deploy:create_asset_dirs"
before "deploy:finalize_update", "deploy:symlink_config"
after "deploy:finalize_update", "deploy:precompile_assets"
after "deploy:finalize_update", "deploy:cleanup"


