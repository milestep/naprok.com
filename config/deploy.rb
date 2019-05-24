# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

branch = ENV['BRANCH'] || 'master'
set :branch, branch

set :application, "naprok.com"
set :repo_url, "git@github.com:milestep/naprok.com.git"
set :keep_releases, 2
set :stage, :production

set :deploy_to, "/home/deployer"
set :current_directory, 'naprok.com'

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml", ".env"

set :linked_dirs, %w(env public/system tmp/pids tmp/cache tmp/sockets)

namespace :deploy do
  task :remove_linked_assets do
    remove :linked_dirs, "public/assets"
  end
end

after 'deploy:set_linked_dirs', 'deploy:remove_linked_assets'
