#require "rvm/capistrano"

set :application, "gooner_in"
set :repository,  "git://github.com/qiyuan-wang/gooner_in.git"
set :domain, "106.186.19.201"
set :user, "zisasign"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :use_sudo, false
set :deploy_to, "/home/zisasign/gooner_in/"

set :normalize_asset_timestamps, false

# keep uploads files
set :shared_children, shared_children + %w{public/uploads}

default_run_options[:pty] = true

role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

