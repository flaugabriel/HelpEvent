require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.i18n.default_locale = 'pt-BR'
    config.time_zone = 'La Paz'
    config.active_record.default_timezone = :local
    Time::DATE_FORMATS[:default] = '%d/%m/%Y %H:%M'
    Date::DATE_FORMATS[:default] = '%d/%m/%Y'
    config.paths.add(Rails.root.join('lib').to_s, eager_load: true)
    config.autoload_paths += %W[#{config.root}/lib].
    config.api_only = true
  end
end
