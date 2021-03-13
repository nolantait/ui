$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "organism-ui"
  spec.version     = Ui::VERSION
  spec.authors     = ["Nolan Tait"]
  spec.email       = ["nolanjtait@gmail.com"]
  spec.homepage    = "https://github.com/nolantait/organism-ui"
  spec.summary     = "A collection of ui components implemented in cells."
  spec.description = "A collection of ui components implemented in cells."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #  if spec.respond_to?(:metadata)
  #    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #  else
  #    raise "RubyGems 2.0 or newer is required to protect against " \
  #      "public gem pushes."
  #  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.1"
  spec.add_dependency "dry-struct", "~> 1.4.0"
  spec.add_dependency "dry-types", "~> 1.5"
  spec.add_dependency "trailblazer-cells", "~> 0.0.3"
  spec.add_dependency "cells-erb", "~> 0.1.0"
  spec.add_dependency "cells-rails", "~> 0.1.3"

  spec.add_development_dependency 'rspec-rails', "< 5.0"
  spec.add_development_dependency 'rspec-cells', "~> 0.3.5"
  spec.add_development_dependency 'capybara', "~> 3.35.3"
  spec.add_development_dependency 'byebug', "~> 11.1.3"
end
