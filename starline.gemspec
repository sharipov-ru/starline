# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'starline/version'

Gem::Specification.new do |spec|
  spec.name          = "starline"
  spec.version       = Starline::VERSION
  spec.authors       = ["Sharipov Ruslan"]
  spec.email         = ["sharipov.ru@gmail.com"]

  spec.summary       = %q{Ruby wrapper for JSON data from StarLine website.}
  spec.description   = %q{StarlineTelematics is a ruby library-wrapper over telematics JSON data from
satellite security and monitoring service which is used in StarLine car alarm
systems (https://starline-online.ru)}
  spec.homepage      = "https://github.com/sharipov-ru/starline_telematics"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fast_haversine", "0.0.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
