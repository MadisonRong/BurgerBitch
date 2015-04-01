require File.expand_path('../boot', __FILE__)

require 'rails/all'

***REMOVED*** Require the gems listed in Gemfile, including any gems
***REMOVED*** you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BurgerBitch
  class Application < Rails::Application
    ***REMOVED*** Settings in config/environments/* take precedence over those specified here.
    ***REMOVED*** Application configuration should go into files in config/initializers
    ***REMOVED*** -- all .rb files in that directory are automatically loaded.

    ***REMOVED*** Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    ***REMOVED*** Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'
    ***REMOVED*** config.active_record.default_timezone = :local

    ***REMOVED*** The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    ***REMOVED*** config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    ***REMOVED*** config.i18n.default_locale = :de

    ***REMOVED*** Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
