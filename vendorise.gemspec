# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vendorise/version'

Gem::Specification.new do |spec|
  spec.name          = "vendorise"
  spec.version       = Vendorise::VERSION
  spec.authors       = ["Iain Beeston"]
  spec.email         = ["iain.beeston@gmail.com"]
  spec.description   = %q{A reusable rake task to vendorise a gem hosted in a private git repo}
  spec.summary       = %q{Uses git subtree to download the source for a gem into /vendor/gems}
  spec.homepage      = "http://github.com/New-Bamboo/vendorise"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
end
