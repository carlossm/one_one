# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'one_one/version'

Gem::Specification.new do |spec|
  spec.name          = "one_one"
  spec.version       = OneOne::VERSION
  spec.authors       = ["Connor Atherton"]
  spec.email         = ["connor@bitnami.com"]

  spec.summary       = %q{A client library for the 1and1 cloud api}
  spec.description   = %q{A client library for the 1and1 cloud api}
  spec.homepage      = "https://github.com/ConnorAtherton/one_one"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'faraday'
  spec.add_dependency 'kartograph'
  spec.add_dependency 'virtus'
  spec.add_dependency 'resource_kit'
  spec.add_dependency 'activesupport'
end
