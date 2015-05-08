# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nabatheon/version'

Gem::Specification.new do |spec|
  spec.name          = 'nabatheon'
  spec.version       = Nabatheon::VERSION
  spec.authors       = ['Jacob Burenstam']
  spec.email         = ['burenstam@gmail.com']
  spec.summary       = %q{Extract named entities and lemmas using StanfordCoreNLP.}
  spec.description   = %q{Extract named entities and lemmas using StanfordCoreNLP (alpha). Assumes that all dependencies are in ~/.stanford-nlp}
  spec.homepage      = 'https://github.com/buren/nabatheon'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'stanford-core-nlp', '0.5.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
end
