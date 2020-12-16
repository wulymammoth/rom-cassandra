# encoding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rom/cassandra/version"

Gem::Specification.new do |gem|

  gem.name             = "rom-cassandra"
  gem.version          = ROM::Cassandra::VERSION.dup
  gem.author           = ["Andrew Kozin"]
  gem.email            = ["andrew.kozin@gmail.com"]
  gem.summary          = "Cassandra support for Ruby Object Mapper"
  gem.description      = gem.summary
  gem.homepage         = "https://rom-rb.org"
  gem.license          = "MIT"

  gem.files            = `git ls-files -z`.split("\x0")
  gem.executables      = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files       = gem.files.grep(%r{^(test|spec|features)/})
  gem.extra_rdoc_files = Dir["README.md", "LICENSE"]
  gem.require_paths    = ["lib"]

  gem.required_ruby_version = ">= 1.9.3"

  gem.add_runtime_dependency 'cassandra-driver', '~> 3.2'
  gem.add_runtime_dependency 'inflecto', '~> 0.0.2'
  gem.add_runtime_dependency 'rom', '~> 5.2'

  gem.add_development_dependency "timecop", "~> 0.8"

end # Gem::Specification
