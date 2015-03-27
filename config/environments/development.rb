Rails.application.configure do
  ***REMOVED*** Settings specified here will take precedence over those in config/application.rb.

  ***REMOVED*** In the development environment your application's code is reloaded on
  ***REMOVED*** every request. This slows down response time but is perfect for development
  ***REMOVED*** since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  ***REMOVED*** Do not eager load code on boot.
  config.eager_load = false

  ***REMOVED*** Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  ***REMOVED*** Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  ***REMOVED*** Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  ***REMOVED*** Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  ***REMOVED*** Debug mode disables concatenation and preprocessing of assets.
  ***REMOVED*** This option may cause significant delays in view rendering with a large
  ***REMOVED*** number of complex assets.
  config.assets.debug = true

  ***REMOVED*** Asset digests allow you to set far-future HTTP expiration dates on all assets,
  ***REMOVED*** yet still be able to expire them through the digest params.
  config.assets.digest = true

  ***REMOVED*** Adds additional error checking when serving assets at runtime.
  ***REMOVED*** Checks for improperly declared sprockets dependencies.
  ***REMOVED*** Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  ***REMOVED*** Raises error for missing translations
  ***REMOVED*** config.action_view.raise_on_missing_translations = true
end
