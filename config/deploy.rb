
set :application, "bergesite.com"
role :app, application
role :web, application
role :db,  application, :primary => true

set :user, "deploy"
set :deploy_to, "/var/www/brightroom/"
set :deploy_via, :remote_cache
# set :use_sudo, true

set :scm, "git"
set :repository, "git@github.com:petticash/wishlists3.git"
set :branch, "master"

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do
  desc "Create DB"
  task :create, :roles => :app do
    run "cd #{current_path} && rake RAILS_ENV=production db:create"
  end
  
  desc "Migrate DB"
  task :migrate, :roles => :app do
    run "cd #{current_path} && rake RAILS_ENV=production db:migrate"
  end
end

namespace :gems do
  default_run_options[:pty] = true 
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_path} && #{sudo} rake RAILS_ENV=production gems:install"
  end
end

