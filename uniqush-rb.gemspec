# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uniqush_ruby_client/version'

Gem::Specification.new do |spec|
  spec.name          = "uniqush-rb"
  spec.version       = Uniqush::VERSION
  spec.authors       = ["Rafael Bandeira"]
  spec.email         = ["rafaelbandeira3@gmail.com"]
  spec.summary       = %q{Client for uniqush-push}
  spec.description   = %q{Client for uniqush-push server for push notifications using GCM, APNS and others http://uniqush.org/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.7.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end
