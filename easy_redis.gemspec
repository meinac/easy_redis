# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_redis/version/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_redis"
  spec.version       = EasyRedis::VERSION
  spec.authors       = ["Mehmet Emin İNAÇ"]
  spec.email         = ["mehmetemininac@gmail.com"]
  spec.summary       = %q{Less coding for redis store}
  spec.description   = %q{Creates getter and setter methods for redis store.}
  spec.homepage      = "http://github.com/meinac/easy_redis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.1'
  spec.add_dependency "redis"
  spec.add_dependency "activerecord"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "pry"
end
