require_relative 'boot'

require 'rails/all'
require 'axlsx'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EducationalConsultancy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.secret_key_base = 'f2f926f6d740f3439dd2ec0ae007bf1b0b81ed2b960bda2873822a10f07dd26eebd6abc2b861706bf7beecd8407171eeb77c138eac26ec8b7229dc073326a25d'

  end
end
