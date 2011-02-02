# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wresque_wrapper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Simon Coffey"]
  s.date = %q{2011-02-02}
  s.description = %q{Allows queueing of model methods, e.g. MyModel.delay.some_method}
  s.email = %q{simon@tribesports.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "init.rb",
    "lib/wresque_wrapper.rb",
    "spec/spec_helper.rb",
    "spec/wresque_wrapper_spec.rb",
    "wresque_wrapper.gemspec"
  ]
  s.homepage = %q{http://github.com/simon@urbanautomaton.com/wresque_wrapper}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Async-style queueing of class methods using Resque}
  s.test_files = [
    "spec/spec_helper.rb",
    "spec/wresque_wrapper_spec.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<resque>, ["~> 1.10.0"])
      s.add_runtime_dependency(%q<rails>, [">= 2.1.0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<mocha>, ["~> 0.9.10"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<resque>, ["~> 1.10.0"])
      s.add_runtime_dependency(%q<rails>, [">= 2.1.0"])
    else
      s.add_dependency(%q<resque>, ["~> 1.10.0"])
      s.add_dependency(%q<rails>, [">= 2.1.0"])
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<mocha>, ["~> 0.9.10"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<resque>, ["~> 1.10.0"])
      s.add_dependency(%q<rails>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<resque>, ["~> 1.10.0"])
    s.add_dependency(%q<rails>, [">= 2.1.0"])
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<mocha>, ["~> 0.9.10"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<resque>, ["~> 1.10.0"])
    s.add_dependency(%q<rails>, [">= 2.1.0"])
  end
end

