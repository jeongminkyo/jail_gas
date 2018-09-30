lock "~> 3.11.0"

set :application, 'jail_gas'
set :repo_url, 'https://github.com/jeongminkyo/jail_gas.git'

set :deploy_to, '/var/www/jail_gas'
set :bundle_flags, ""
set :use_sudo, true

set :passenger_restart_with_sudo, true
set :passenger_restart_with_touch, true
set :passenger_in_gemfile, true
set :passenger_restart_options,
    -> { "#{deploy_to} --ignore-app-not-running --rolling-restart" }

set :linked_dirs, %w{log}

namespace :deploy do
  desc 'Restart application'
  after 'deploy:published', 'nginx:restart'

  task :restart do
    on roles(:web), in: :sequence, wait: 20 do
    end
  end
  after :finishing, 'deploy:cleanup'
end