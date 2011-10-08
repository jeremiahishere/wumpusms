set :application, "wumpus"
set :stages, %w(staging production)
set :default_stage, 'development' 
require 'capistrano/ext/multistage' 

set :repository,  "git@github.com:cloudspace/wumpus.git"

set :deploy_via, :remote_cache
default_run_options[:pty] = true 

#set :ssh_options, { :keys => ['~/.ssh/id_rsa'], :forward_agent => true, :user => "root" }
set :ssh_options, { :forward_agent => true, :user => "root" }

set :scm, :git
#set :use_sudo,	true
set :keep_releases, 10 

role :web, "174.129.178.244"
role :app, "174.129.178.244"
role :db, "174.129.178.244", :primary => true

namespace :deploy do
  task :restart do
    #nothing to restart right now.  Might need to change that to restart apache after each deploy.
  end
end

task :reset_permissions do
  run "sudo chown -R #{user}:#{user} /srv/#{application}*"
end

task :create_symlinks do
  #below is an example symlink to create
  #run "ln -s /srv/#{application}/shared/system/files /srv/#{application}/current/public/files"
end

after 'deploy:setup' do
  reset_permissions
end

after :deploy do
  create_symlinks
  reset_permissions
end
