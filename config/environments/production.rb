Rails.application.configure do
  ***REMOVED*** Settings specified here will take precedence over those in config/application.rb.

  ***REMOVED*** Code is not reloaded between requests.
  config.cache_classes = true

  ***REMOVED*** Eager load code on boot. This eager loads most of Rails and
  ***REMOVED*** your application in memory, allowing both threaded web servers
  ***REMOVED*** and those relying on copy on write to perform better.
  ***REMOVED*** Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  ***REMOVED*** Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  ***REMOVED*** Enable Rack::Cache to put a simple HTTP cache in front of your application
  ***REMOVED*** Add `rack-cache` to your Gemfile before enabling this.
  ***REMOVED*** For large-scale production use, consider using a caching reverse proxy like
  ***REMOVED*** NGINX, varnish or squid.
  ***REMOVED*** config.action_dispatch.rack_cache = true

  ***REMOVED*** Disable serving static files from the `/public` folder by default since
  ***REMOVED*** Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  ***REMOVED*** Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  ***REMOVED*** config.assets.css_compressor = :sass

  ***REMOVED*** Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  ***REMOVED*** Asset digests allow you to set far-future HTTP expiration dates on all assets,
  ***REMOVED*** yet still be able to expire them through the digest params.
  config.assets.digest = true

  ***REMOVED*** `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  ***REMOVED*** Specifies the header that your server uses for sending files.
  ***REMOVED*** config.action_dispatch.x_sendfile_header = 'X-Sendfile' ***REMOVED*** for Apache
  ***REMOVED*** config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' ***REMOVED*** for NGINX

  ***REMOVED*** Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  ***REMOVED*** config.force_ssl = true

  ***REMOVED*** Use the lowest log level to ensure availability of diagnostic information
  ***REMOVED*** when problems arise.
  config.log_level = :debug

  ***REMOVED*** Prepend all log lines with the following tags.
  ***REMOVED*** config.log_tags = [ :subdomain, :uuid ]

  ***REMOVED*** Use a different logger for distributed setups.
  ***REMOVED*** config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  ***REMOVED*** Use a different cache store in production.
  ***REMOVED*** config.cache_store = :mem_cache_store

  ***REMOVED*** Enable serving of images, stylesheets, and JavaScripts from an asset server.
  ***REMOVED*** config.action_controller.asset_host = 'http://assets.example.com'

  ***REMOVED*** Ignore bad email addresses and do not raise email delivery errors.
  ***REMOVED*** Set this to true and configure the email server for immediate delivery to raise delivery errors.
  ***REMOVED*** config.action_mailer.raise_delivery_errors = false

  ***REMOVED*** Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  ***REMOVED*** the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  ***REMOVED*** Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  ***REMOVED*** Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  ***REMOVED*** Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
