# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap3_copy_strategy/version'

Gem::Specification.new do |spec|
  spec.name          = "cap3_copy_strategy"
  spec.version       = Cap3CopyStrategy::VERSION
  spec.authors       = ["Julien Gantner", "Marcus Seel"]
  spec.email         = ["julien.gantner@softwareinmotion.de", "marcus.seel@softwareinmotion.de"]
  spec.description   = %q{recreates the capistrano copy strategy. creates a tar.gz file and uploads it to the server where it gets unpacked}
  spec.summary       = %q{recreates the capistrano copy strategy}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
