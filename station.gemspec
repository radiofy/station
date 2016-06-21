# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "station"
  spec.version       = "1.0.0"
  spec.authors       = ["Linus Oleander"]
  spec.email         = ["linus@oleander.nu"]
  spec.summary       = %q{Station parsers for radiofy.se}
  spec.description   = %q{Station parsers for radiofy.se}
  spec.homepage      = "http://radiofy.se"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("music_sanitizer")
  spec.add_dependency("nokogiri")
  spec.add_dependency("activesupport")
  spec.add_dependency("fast_blank")
  spec.add_dependency("berg")

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end