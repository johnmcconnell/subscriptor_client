# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'subscriptor_client/version'

Gem::Specification.new do |spec|
  spec.name          = "subscriptor_client"
  spec.version       = SubscriptorClient::VERSION
  spec.authors       = ["johnmcconnell"]
  spec.email         = ["johnnyillinois@gmail.com"]
  spec.summary       = %q{A client for the subscriptor gem.}
  spec.description   = %q{A client for the subscriptor gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client', '~> 1.7.2'
  spec.add_dependency 'json_client', '~> 0.1.0'

  spec.add_development_dependency "simplecov", "~> 0.8.0"
  spec.add_development_dependency "coveralls", "~> 0.7.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-collection_matchers"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
