# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tranquility/version'

Gem::Specification.new do |spec|
  spec.name          = "tranquility"
  spec.version       = Tranquility::VERSION
  spec.authors       = ["James Harrison"]
  spec.email         = ["james@talkunafraid.co.uk"]
  spec.summary       = %q{Access to EVE Online's CREST API}
  spec.description   = %q{A library to provide nice, Ruby-friendly access to EVE Online's CREST API}
  spec.homepage      = "http://github.com/JamesHarrison/tranquility"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "multi_json"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 3.0"
end
