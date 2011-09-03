# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{eaal}
  s.version = "0.1.7.20110903163904"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Peter Petermann}]
  s.date = %q{2011-09-03}
  s.description = %q{EAAL (Eve API Access Layer) is a ruby library for accessing data of the API of 
the game Eve Online}
  s.email = [%q{ppetermann80@googlemail.com}]
  s.extra_rdoc_files = [%q{History.txt}, %q{LICENSE.txt}, %q{Manifest.txt}]
  s.files = [%q{History.txt}, %q{LICENSE.txt}, %q{Manifest.txt}, %q{README.rdoc}, %q{Rakefile}, %q{lib/eaal.rb}, %q{lib/eaal/api.rb}, %q{lib/eaal/cache/base.rb}, %q{lib/eaal/cache/file.rb}, %q{lib/eaal/cache/memcached.rb}, %q{lib/eaal/exception.rb}, %q{lib/eaal/result.rb}, %q{lib/eaal/rowset.rb}, %q{script/console}, %q{script/destroy}, %q{script/generate}, %q{test/fixtures/test/test/account/Characters/Request_.xml}, %q{test/fixtures/test/test/char/Killlog/Request_.xml}, %q{test/fixtures/test/test/char/Killlog/Request_characterID:12345.xml}, %q{test/fixtures/test/test/eve/AllianceList/Request_.xml}, %q{test/test_eaal.rb}, %q{test/test_helper.rb}, %q{.gemtest}]
  s.homepage = %q{http://eaal.rubyforge.org}
  s.rdoc_options = [%q{--main}, %q{README.txt}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{eaal}
  s.rubygems_version = %q{1.8.6}
  s.summary = %q{EAAL (Eve API Access Layer) is a ruby library for accessing data of the API of  the game Eve Online}
  s.test_files = [%q{test/test_eaal.rb}, %q{test/test_helper.rb}]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6"])
      s.add_runtime_dependency(%q<memcache-client>, [">= 1.7.1"])
      s.add_development_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_development_dependency(%q<hoe>, ["~> 2.12"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.0.2"])
      s.add_dependency(%q<hpricot>, [">= 0.6"])
      s.add_dependency(%q<memcache-client>, [">= 1.7.1"])
      s.add_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_dependency(%q<hoe>, ["~> 2.12"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.0.2"])
    s.add_dependency(%q<hpricot>, [">= 0.6"])
    s.add_dependency(%q<memcache-client>, [">= 1.7.1"])
    s.add_dependency(%q<newgem>, [">= 1.5.3"])
    s.add_dependency(%q<hoe>, ["~> 2.12"])
  end
end
