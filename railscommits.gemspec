# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railscommits/version'

Gem::Specification.new do |spec|
  spec.name          = "railscommits"
  spec.version       = RailsCommits::VERSION
  spec.authors       = ["Paul Malenke"]
  spec.email         = ["paul.malenke@mac.com"]
  spec.summary       = %q{See the latest commits in the Rails repository on GitHub.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/paulmalenke/railscommits/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "slop"
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
