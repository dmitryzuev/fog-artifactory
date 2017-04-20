# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/artifactory/version'

Gem::Specification.new do |spec|
  spec.name          = 'fog-artifactory'
  spec.version       = Fog::Artifactory::VERSION
  spec.authors       = ['Dmitry Zuev']
  spec.email         = ['d.zuev@rambler-co.ru']

  spec.summary       = "Module for the 'fog' gem to support JFrog Artifactory."
  spec.description   = "This library can be used as a module for `fog` or as standalone provider
                        to use the JFrog Artifactory in applications."
  spec.homepage      = 'https://github.com/dmitryzuev/fog-artifactory'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_dependency 'fog-core', '~> 1.43'
  spec.add_dependency 'fog-json', '~> 1.0'
  spec.add_dependency 'artifactory', '~> 2.8'
end
