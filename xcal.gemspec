# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcal/version'

Gem::Specification.new do |spec|
  spec.name          = "xcal"
  spec.version       = Xcal::VERSION
  spec.authors       = ["xmisao"]
  spec.email         = ["mail@xmisao.com"]

  spec.summary     = "xcal displays a japanese calendar"
  spec.description = "xcal is a command line tool that displays japanese calendar like UNIX's `cal` command."
  spec.homepage    = 'https://github.com/xmisao/xcal'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("icalendar", "~> 1")
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
