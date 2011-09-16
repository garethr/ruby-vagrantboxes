# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vagrantboxes/version"

Gem::Specification.new do |s|
  s.name        = "vagrantboxes"
  s.version     = Vagrantboxes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gareth Rushgrove"]
  s.email       = ["gareth@morethanseven.net"]
  s.homepage    = "http://vagrantbox.es"
  s.summary     = %q{Vagrant extension to download boxes from vagrantbox.es}
  s.description = %q{Vagrant extension to search and download boxes from vagrantbox.es}

  s.rubyforge_project = "vagrantboxes"

  s.add_dependency "vagrant", "~> 0.8.0"
  s.add_dependency "json"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
