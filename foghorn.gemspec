# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','foghorn','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'foghorn'
  s.version = Foghorn::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
# Add your other files here if you make them
  s.files = %w(
bin/foghorn
lib/foghorn/version.rb
lib/foghorn.rb
  )
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','foghorn.rdoc']
  s.rdoc_options << '--title' << 'foghorn' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'foghorn'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rspec')
  s.add_development_dependency('guard')
  s.add_development_dependency('guard-rspec')
  s.add_runtime_dependency('gli','2.7.0')
  s.add_runtime_dependency('af','0.3.18.12')
  s.add_runtime_dependency('rainbow')
end
