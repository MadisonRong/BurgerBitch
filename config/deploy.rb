***REMOVED*** config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'BurgerBitch'
set :deploy_user, 'ubuntu'
set :repo_url, 'git@github.com:MadisonRong/BurgerBitch.git'
set :branch, 'master-deploy'
set :stage, :production
set :rails_env, :production
set :deploy_to, '/home/ubuntu/app/BurgerBitch'

set :rvm_ruby_string, '1.26.11'


***REMOVED*** Default branch is :master
***REMOVED*** ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

***REMOVED*** Default deploy_to directory is /var/www/my_app_name
***REMOVED*** set :deploy_to, '/var/www/my_app_name'

***REMOVED*** Default value for :scm is :git
***REMOVED*** set :scm, :git

***REMOVED*** Default value for :format is :pretty
***REMOVED*** set :format, :pretty

***REMOVED*** Default value for :log_level is :debug
***REMOVED*** set :log_level, :debug

***REMOVED*** Default value for :pty is false
***REMOVED*** set :pty, true

***REMOVED*** Default value for :linked_files is []
***REMOVED*** set :linked_files, fetch(:linked_files, []).push('config/database.yml')

***REMOVED*** Default value for linked_dirs is []
***REMOVED*** set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

***REMOVED*** Default value for default_env is {}
***REMOVED*** set :default_env, { path: "/opt/ruby/bin:$PATH" }

***REMOVED*** Default value for keep_releases is 5
***REMOVED*** set :keep_releases, 5

namespace :deploy do

 after :restart, :clear_cache do
   on roles(:web), in: :groups, limit: 3, wait: 10 do
      ***REMOVED*** Here we can do anything such as:
      ***REMOVED*** within release_path do
      ***REMOVED***   execute :rake, 'cache:clear'
      ***REMOVED*** end
   end
 end

end
