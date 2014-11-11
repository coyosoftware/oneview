# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oneview/version'

Gem::Specification.new do |spec|
  spec.name          = "oneview"
  spec.version       = Oneview::VERSION
  spec.authors       = ["Gustavo Berdugo"]
  spec.email         = ["gberdugo@gmail.com"]
  spec.summary       = %q{Oneview API consumer}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = "https://github.com/coyosoftware/oneview"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency('httparty', "~> 0.13")

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "webmock", "~> 1.20"
  spec.add_development_dependency "debugger", "~> 1.6"
end
