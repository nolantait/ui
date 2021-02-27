$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "ui"
  spec.version     = Ui::VERSION
  spec.authors     = ["Nolan Tait"]
  spec.email       = ["nolanjtait@gmail.com"]
  spec.homepage    = "https://www.taiventures.ca"
  spec.summary     = "Summary of Ui."
  spec.description = "Description of Ui."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.1"
  spec.add_dependency "dry-struct"
  spec.add_dependency "percent"
  spec.add_dependency "trailblazer-cells"
  spec.add_dependency "cells-erb"
  spec.add_dependency "cells-rails"
  spec.add_dependency "tailwindcss-rails"

  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency 'rspec-cells'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'byebug'
end
