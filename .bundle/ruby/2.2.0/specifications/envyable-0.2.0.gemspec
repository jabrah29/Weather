# -*- encoding: utf-8 -*-
# stub: envyable 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "envyable"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Phil Nash"]
  s.date = "2015-03-16"
  s.description = "The simplest yaml to ENV config loader"
  s.email = ["philnash@gmail.com"]
  s.homepage = "https://github.com/philnash/envyable"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "The simplest yaml to ENV config loader"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
