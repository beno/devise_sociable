require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "devise_sociable"
  gem.homepage = "http://github.com/beno/devise_sociable"
  gem.license = "MIT"
  gem.summary = "Keep track of who is currently online."
  gem.description = "Track the last request and logout. Provides user.active? and User.actives methods"
  gem.email = "michelbenevento@yahoo.com"
  gem.authors = ["beno"]
  gem.add_runtime_dependency 'warden'
  gem.add_runtime_dependency 'devise'
  gem.add_runtime_dependency 'rails', '>= 3.0.4'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


task :default => :test
