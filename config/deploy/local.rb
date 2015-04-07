***REMOVED*** Simple Role Syntax
***REMOVED*** ==================
***REMOVED*** Supports bulk-adding hosts to roles, the primary server in each group
***REMOVED*** is considered to be the first unless any hosts have the primary
***REMOVED*** property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{deploy@example.com}
role :web, %w{deploy@example.com}
role :db,  %w{deploy@example.com}


***REMOVED*** Extended Server Syntax
***REMOVED*** ======================
***REMOVED*** This can be used to drop a more detailed server definition into the
***REMOVED*** server list. The second argument is a, or duck-types, Hash and is
***REMOVED*** used to set extended properties on the server.

server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value


***REMOVED*** Custom SSH Options
***REMOVED*** ==================
***REMOVED*** You may pass any option but keep in mind that net/ssh understands a
***REMOVED*** limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html***REMOVED***method-c-start).
***REMOVED***
***REMOVED*** Global options
***REMOVED*** --------------
***REMOVED***  set :ssh_options, {
***REMOVED***    keys: %w(/home/rlisowski/.ssh/id_rsa),
***REMOVED***    forward_agent: false,
***REMOVED***    auth_methods: %w(password)
***REMOVED***  }
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
