# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ruby_game/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matthieu Segret"]
  gem.email         = ["matthieu@humancoders.com"]
  gem.description   = %q{Ruby Game est un jeu pour apprendre à développer avec Ruby}
  gem.summary       = %q{Ruby Game est un jeu pour apprendre à développer avec Ruby}
  gem.homepage      = "http://formations.humancoders.com/formations/ruby"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ruby_game"
  gem.require_paths = ["lib"]
  gem.version       = RubyGame::VERSION

  gem.add_dependency "gosu"
end
