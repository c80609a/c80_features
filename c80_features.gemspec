# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c80_features/version'

Gem::Specification.new do |spec|
  spec.name          = "c80_features"
  spec.version       = C80Features::VERSION
  spec.authors       = ["C80609A"]
  spec.email         = ["c080609a@gmail.com"]

  spec.summary       = 'Features'
  spec.description   = 'Adds model Features::Para (paragraph) to site,
which are usually enumerated as text blocks one by one in a single row
(e.g.: testimonials, features, trust symbols etc.). '
  spec.homepage      = "https://github.com/c80609a/c80_features"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'rails', '~> 4.1', '>= 4.1.4'
  spec.add_dependency 'activeadmin'
  spec.add_dependency 'carrierwave'

end
