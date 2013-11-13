# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct09/version'

Gem::Specification.new do |spec|
  spec.name          = "prct09"
  spec.version       = Prct09::VERSION
  spec.authors       = ["Krishna Hemnani"]
  spec.email         = ["alu0100536874@ull.edu.es"]
  spec.description   = %q{TODO: Gema para matrices}
  spec.summary       = %q{TODO: Operaciones con matrice}
  spec.homepage      = "git@github.com:alu0100536874/prct09.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
