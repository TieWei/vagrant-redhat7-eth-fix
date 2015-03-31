# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-redhat7_eth_fix/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-redhat7_eth_fix"
  spec.version       = VagrantPlugins::GuestRedhat7EthFix::VERSION
  spec.authors       = ["Wei Tie"]
  spec.email         = ["wtie@cisco.com"]
  spec.summary       = "Vagrant plugin for Redhat 7 using non consistent nic naming"
  spec.description   = "Vagrant plugin for Redhat 7 boot with net.ifnames=0 and biosdevname=0"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
