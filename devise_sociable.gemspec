# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "devise_sociable"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["beno"]
  s.date = "2013-02-02"
  s.description = "Track the last request and logout. Provides user.active? and User.actives methods"
  s.email = "michelbenevento@yahoo.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".bundle/config",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "devise_sociable.gemspec",
    "lib/devise_sociable.rb",
    "lib/devise_sociable/hooks/sociable.rb",
    "lib/devise_sociable/model.rb",
    "lib/devise_sociable/rails.rb",
    "lib/devise_sociable/version.rb",
    "lib/generators/devise_sociable/devise_sociable_generator.rb",
    "lib/generators/devise_sociable/templates/migration.rb",
    "test/support/helpers.rb",
    "test/test_devise_sociable_cache.rb",
    "test/test_devise_sociable_cookie.rb",
    "test/test_devise_sociable_server.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "http://github.com/beno/devise_sociable"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Keep track of who is currently online."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 4.0.2"])
      # s.add_runtime_dependency(%q<warden>, ["~> 1.2.1"])
      s.add_runtime_dependency(%q<devise>, ["~> 3.2.2"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_runtime_dependency(%q<warden>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.4"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.8"])
      s.add_dependency(%q<warden>, ["~> 1.2.1"])
      s.add_dependency(%q<devise>, ["~> 2.2.2"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<warden>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.0.4"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.8"])
    s.add_dependency(%q<warden>, ["~> 1.2.1"])
    s.add_dependency(%q<devise>, ["~> 2.2.2"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<warden>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.0.4"])
  end
end

