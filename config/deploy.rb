# lock '3.2.1'

set :application, 'jaunces'
set :repo_url, 'git@github.com:amoose/JauNCES.git'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# set :branch, 'feature/creation'
# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(config/mongoid.yml config/application.yml config/redis/production.conf)

# Default value for linked_dirs is []
set :linked_dirs, %w(bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets)

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# set :rbenv_type, :user # or :system, depends on your rbenv setup
# set :rbenv_ruby, '2.1.3'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all # default value

set :rvm_ruby_version, '2.2.3'      # Defaults to: 'default'
# set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # execute :bundle, :exec, :thin, "restart -C config/thin.yml"
          execute "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
        end
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

after 'deploy:publishing', 'deploy:restart'

# set :stages, %w(production)
# set :default_stage, "production"
# set :application, "jaunces"
# set :repository, "git@github.com:amoose/jaunces.git"
# set :scm, :git
# # set :use_sudo, true
# set :user, 'ubuntu'
# # ssh_options[:forward_agent] = true
# # default_run_options[:pty] = true
# set :rvm_ruby_string, '2.2.3'
# set :git_shallow_clone, 1
# set :keep_releases, 5

# set :shared_path, "/var/www/#{application}/shared"
# set :rvm_type, :user
# set :deploy_to, "/var/www/#{application}"

# set :deploy_via, :copy

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end

#   desc "copies shared config to app config"
# 	task :symlink_config do
# 		run "ln -nfs #{shared_path}/config/redis/#{rails_env}.conf #{release_path}/config/redis/#{rails_env}.conf"
# 		run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
# 	end

# 	desc "creates asset dirs"
# 	task :create_asset_dirs do
# 		run "mkdir -p #{release_path}/public/images"
# 		run "mkdir -p #{release_path}/public/stylesheets"
# 		run "mkdir -p #{release_path}/public/javascripts"
# 	end

# 	desc "precompiles assets"
# 	task :precompile_assets do
# 		run "RAILS_ENV=#{rails_env} cd #{release_path} && rake assets:precompile"
# 	end
# end

# namespace :rvm do
#   task :trust_rvmrc do
#     run "rvm rvmrc trust #{release_path}"
#   end
# end

# before "deploy:finalize_update", "deploy:create_asset_dirs"
# before "deploy:finalize_update", "deploy:symlink_config"
# after "deploy:finalize_update", "deploy:precompile_assets"
# after "deploy:finalize_update", "deploy:cleanup"
