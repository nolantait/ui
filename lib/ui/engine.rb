module Ui
  class Engine < ::Rails::Engine
    isolate_namespace Ui

    config.autoload_paths << "#{config.root}/lib"

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
