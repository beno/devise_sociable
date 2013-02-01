# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "actionmailer"
  s.version = "0.6.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.autorequire = "action_mailer"
  s.cert_chain = nil
  s.date = "2005-01-18"
  s.description = "Makes it trivial to test and deliver emails sent from a single service layer."
  s.email = "david@loudthinking.com"
  s.homepage = "http://actionmailer.rubyonrails.org"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.requirements = ["none"]
  s.rubyforge_project = "actionmailer"
  s.rubygems_version = "1.8.23"
  s.summary = "Service layer for easy email delivery and testing."

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 0.9.5"])
    else
      s.add_dependency(%q<actionpack>, [">= 0.9.5"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 0.9.5"])
  end
end
