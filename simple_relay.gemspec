# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_relay/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_relay"
  spec.version       = SimpleRelay::VERSION
  spec.authors       = ["Vlad Verestiuc"]
  spec.email         = ["verestiuc.vlad@gmail.com"]
  spec.description   = %q{A simple SMTP relay tool}
  spec.summary       = %q{Uses different SMTP accounts based on the sender of the message}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "eventmachine"
  spec.add_dependency "mail"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"

  spec.executables = ["simple_relay"]
end
