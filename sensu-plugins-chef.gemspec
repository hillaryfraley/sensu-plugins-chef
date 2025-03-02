lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'date'
require_relative 'lib/sensu-plugins-chef'

Gem::Specification.new do |s|
  s.authors                = ['Sensu Plugins and contributors']
  s.date                   = Date.today.to_s
  s.description            = 'This plugin provides native Chef instrumentation
                              for monitoring, including: report stale nodes,
                              service health, as well as a handler to remove
                              stale Sensu clients'
  s.email                  = '<sensu-users@googlegroups.com>'
  s.executables            = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  s.files                  = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.homepage               = 'https://github.com/sensu-plugins/sensu-plugins-chef'
  s.license                = 'MIT'
  s.metadata               = { 'maintainer'         => 'sensu-plugin',
                               'development_status' => 'active',
                               'production_status'  => 'unstable - testing recommended',
                               'release_draft'      => 'false',
                               'release_prerelease' => 'false' }
  s.name                   = 'sensu-plugins-chef'
  s.platform               = Gem::Platform::RUBY
  s.post_install_message   = 'You can use the embedded Ruby by setting EMBEDDED_RUBY=true in /etc/default/sensu'
  s.require_paths          = ['lib']
  s.required_ruby_version  = '>= 2.3.0'
  s.summary                = 'Sensu plugins for chef'
  s.test_files             = s.files.grep(%r{^(test|spec|features)/})
  s.version                = SensuPluginsChef::Version::VER_STRING

  s.add_runtime_dependency 'hashie',       ['< 4.0.0', '>= 2.0.2']
  s.add_runtime_dependency 'ridley',       '= 5.1.1'
  s.add_runtime_dependency 'sensu-plugin', '~> 4.0'
  s.add_runtime_dependency 'varia_model', '0.6'

  s.add_development_dependency 'bundler', '~> 1.12'

  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  s.add_development_dependency 'github-markup',             '~> 3.0'
  s.add_development_dependency 'pry',                       '~> 0.10'
  s.add_development_dependency 'rake',                      '~> 12.3'
  s.add_development_dependency 'redcarpet',                 '~> 3.2'
  s.add_development_dependency 'rspec',                     '~> 3.4'
  s.add_development_dependency 'rubocop',                   '~> 0.51.0'
  s.add_development_dependency 'yard',                      '~> 0.9.11'
end
