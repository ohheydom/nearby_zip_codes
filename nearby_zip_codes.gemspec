# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nearby_zip_codes/version'

Gem::Specification.new do |spec|
  spec.name          = 'nearby_zip_codes'
  spec.version       = NearbyZipCodes::VERSION
  spec.authors       = ['Dom Leone']
  spec.email         = ['ohheydom@gmail.com']
  spec.summary       = %q{This Ruby gem searches for nearby zip codes.}
  spec.description   = %q{This Ruby gem searches for nearby zip codes within certain parameters.}
  spec.homepage      = 'https://github.com/ohheydom/nearby_zip_codes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec-rails', '~> 3.0'
  spec.add_runtime_dependency 'sequel', '~> 4.12'
  spec.add_runtime_dependency 'sqlite3', '~> 1.3'
end
