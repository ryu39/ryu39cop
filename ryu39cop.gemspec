# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ryu39cop/version'

Gem::Specification.new do |spec|
  spec.name          = 'ryu39cop'
  spec.version       = Ryu39Cop::VERSION
  spec.authors       = ['ryu39']
  spec.email         = ['dev.ryu39@gmail.com']

  spec.summary       = 'ryu39\'s rubocop configuration'
  spec.description   = 'ryu39\'s rubocop configuration'
  spec.homepage      = 'https://github.com/ryu39/ryu39cop'
  spec.license       = 'MIT'

  spec.files         = %w(LICENSE.txt exe/ryu39cop templates/.rubocop.yml) +
                       Dir['lib/**/*.rb'] + Dir['config/**/*.yml']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rubocop', '~> 0.49.1'
  spec.add_runtime_dependency 'rubocop-rspec'

  spec.add_development_dependency 'bundler', '~> 1.15.1'
  spec.add_development_dependency 'rake', '~> 12.0'
end
