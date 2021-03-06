# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oneview/version'

Gem::Specification.new do |spec|
  spec.name          = "oneview"
  spec.version       = Oneview::VERSION
  spec.authors       = ["Gustavo Berdugo"]
  spec.email         = ["gberdugo@gmail.com"]
  spec.summary       = %q{This gem provides integration with Oneview APIs (http://www.oneview.com.br/)}
  spec.description   = %q{The goal of this gem is to simplify the access to Oneview API (http://www.oneview.com.br/), for more information about this API, visit: http://coyosoftware.github.io/}
  spec.homepage      = "https://github.com/coyosoftware/oneview"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency('httparty', "~> 0.13")

  spec.add_development_dependency "bundler", "~> 1.6"
end
