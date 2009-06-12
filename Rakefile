require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'spec/rake/spectask'

GEM = "rack_fitter_happier"
GEM_VERSION = "0.0.1"
AUTHOR = "Corey Donohoe"
EMAIL = "atmos@atmos.org"
HOMEPAGE = "http://atmos.org"
SUMMARY = "A gem that provides simple heartbeat"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  # Uncomment this to add a dependency
  # s.add_dependency "foo"

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

Spec::Rake::SpecTask.new(:default) do |t|
  t.spec_opts << %w(-fs --color)
  t.spec_opts << '--loadby' << 'random'
  t.spec_files = Dir["spec/*_spec.rb"]
  t.rcov = ENV.has_key?('NO_RCOV') ? ENV['NO_RCOV'] != 'true' : true
  t.rcov_opts << '--exclude' << 'spec'

  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
  t.rcov_opts << '--only-uncovered'
end
