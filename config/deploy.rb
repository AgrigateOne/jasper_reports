# config valid for current version and patch releases of Capistrano
# lock '~> 3.16.0'

set :application, 'jasper_reports'
set :repo_url, 'git@github.com:AgrigateOne/jasper_reports.git'
set :chruby_ruby, 'ruby-3.3.5'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

desc 'Create a symlink for SR2 to use SR client-specific reports'
task :client_symlink do
  on primary :app do
    within release_path do
      execute :ln, "-s 'sr' 'nspack/sr2'"
    end
  end
end


namespace :deploy do
  after :updated, :symlink_clients do
    invoke 'client_symlink'
  end
end

namespace :deploy do
  after :updated, :restart_service do
    on roles(:app) do |_|
      puts('----------------------------------------------------------------------------------------------')
      puts('---')
      puts('--- REMEMBER: Restart the Jruby Jasper service:: sudo systemctl restart jruby_jasper.service')
      puts('---       OR: Use the nsmenu option to restart Jruby Jasper.')
      puts('---')
      puts('----------------------------------------------------------------------------------------------')
    end
  end
end
