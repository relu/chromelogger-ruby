$:.push File.expand_path("../lib", __FILE__)
require "chromelogger/version"

Gem::Specification.new do |s|
  s.name          = 'chromelogger'
  s.version       = Chromelogger::VERSION.dup
  s.platform      = Gem::Platform::RUBY
  s.license       = "MIT"
  s.summary       = "Chromelogger"
  s.description   = ""
  s.authors       = ["Aurel Canciu"]
  s.email         = 'aurelcanciu@gmail.com'
  s.files         = ["lib/chromelogger.rb"]
  s.homepage      = 'https://github.com/relu/chromelogger-ruby'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ["lib"]
end
