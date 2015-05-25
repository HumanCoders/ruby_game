# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_game/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_game"
  spec.version       = RubyGame::VERSION
  spec.authors       = ["Matthieu Segret"]
  spec.email         = ["matthieu.segret@gmail.com"]

  spec.summary       = %q{Ruby Game est un jeu pour apprendre à développer avec Ruby}
  spec.description   = %q{Ruby Game est un jeu pour apprendre à développer avec Ruby}
  spec.homepage      = "https://www.humancoders.com/formations/ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gosu"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
