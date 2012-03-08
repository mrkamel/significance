# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "significance/version"

Gem::Specification.new do |s|
  s.name        = "significance"
  s.version     = Significance::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = ""
  s.summary     = %q{Calcuate significance of cooccurring words}
  s.description = %q{Calculate significance of cooccurring words}

  s.rubyforge_project = "significance"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
