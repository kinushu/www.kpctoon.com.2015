require 'dotenv'

Dotenv.load

# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'www.kpctoon.com.2015'
set :repo_url, 'git@github.com:kinushu/www.kpctoon.com.2015.git'

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc "ls"
  task :ls do
    on roles(:web) do
      execute "id"
      execute "ruby -v"
      execute "which ruby"
      execute "which rbenv"
      execute "pwd"
    end
  end
end

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
