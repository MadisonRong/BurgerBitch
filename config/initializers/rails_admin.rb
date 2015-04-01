RailsAdmin.config do |config|

  ***REMOVED******REMOVED******REMOVED*** Popular gems integration

  ***REMOVED******REMOVED*** == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ***REMOVED******REMOVED*** == Cancan ==
  ***REMOVED*** config.authorize_with :cancan

  ***REMOVED******REMOVED*** == PaperTrail ==
  ***REMOVED*** config.audit_with :paper_trail, 'User', 'PaperTrail::Version' ***REMOVED*** PaperTrail >= 3.0.0

  ***REMOVED******REMOVED******REMOVED*** More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     ***REMOVED*** mandatory
    index                         ***REMOVED*** mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ***REMOVED******REMOVED*** With an audit adapter, you can add:
    ***REMOVED*** history_index
    ***REMOVED*** history_show
  end
end
