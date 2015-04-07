***REMOVED*** Simple Role Syntax
***REMOVED*** ==================
***REMOVED*** Supports bulk-adding hosts to roles, the primary server in each group
***REMOVED*** is considered to be the first unless any hosts have the primary
***REMOVED*** property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{172.16.10.26}
role :web, %w{172.16.10.26}
role :db,  %w{172.16.10.26}

set :deploy_to, "/home/***REMOVED***{fetch(:deploy_user)}/apps/***REMOVED***{fetch(:full_app_name)}"
set :rails_env, :production
***REMOVED*** set :unicorn_worker_count, 5
set :enable_ssl, false

***REMOVED*** Extended Server Syntax
***REMOVED*** ======================
***REMOVED*** This can be used to drop a more detailed server definition into the
***REMOVED*** server list. The second argument is a, or duck-types, Hash and is
***REMOVED*** used to set extended properties on the server.

server '172.16.10.26', user: 'MadisonRong', roles: %w{web app}, port: 1234


***REMOVED*** Custom SSH Options
***REMOVED*** ==================
***REMOVED*** You may pass any option but keep in mind that net/ssh understands a
***REMOVED*** limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html***REMOVED***method-c-start).
***REMOVED***
***REMOVED*** Global options
***REMOVED*** --------------
 set :ssh_options, {
   keys: %w(/Users/MadisonRong/.ssh/id_rsa),
   forward_agent: false,
   ***REMOVED*** auth_methods: %w(password)
 }
***REMOVED***
***REMOVED*** And/or per server (overrides global)
***REMOVED*** ------------------------------------
***REMOVED*** server 'example.com',
***REMOVED***   user: 'user_name',
***REMOVED***   roles: %w{web app},
***REMOVED***   ssh_options: {
***REMOVED***     user: 'user_name', ***REMOVED*** overrides user setting above
***REMOVED***     keys: %w(/home/user_name/.ssh/id_rsa),
***REMOVED***     forward_agent: false,
***REMOVED***     auth_methods: %w(publickey password)
***REMOVED***     ***REMOVED*** password: 'please use keys'
***REMOVED***   }
