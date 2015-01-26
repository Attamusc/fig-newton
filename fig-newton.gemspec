# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fig-newton/version"

Gem::Specification.new do |spec|
  spec.name          = "fig-newton"
  spec.version       = FigNewton::VERSION
  spec.authors       = ["Sean Dunn"]
  spec.email         = ["sedunn@adobe.com"]
  spec.summary       = "Wrapper tooling around fig to manage application stacks."
  spec.description   = "Wrapper tooling around fig to manage application stacks."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19.1"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
