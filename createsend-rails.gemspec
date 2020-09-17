# encoding: UTF-8
$:.push File.expand_path('./lib', File.dirname(__FILE__))
require 'createsend-rails/version'

Gem::Specification.new do |s|
  s.name = 'createsend-rails'
  s.version = CreatesendRails::VERSION
  s.authors = ['Andrew Scott', 'Rory MacDonald', 'Martin Vandersteen']
  s.description = ''
  s.email = %w{martin@koalect.com andrew@madetech.co.uk rory@madetech.co.uk}
  s.homepage = 'https://github.com/MartinVandersteen/createsend-rails'
  s.summary = 'Campaign Monitor transactional email adapter for ActionMailer'
  s.licenses = ['MIT']

  s.extra_rdoc_files = %w{LICENSE README.md}
  s.rdoc_options = %w{--charset=UTF-8}

  s.files         = Dir['{lib,spec}/**/*.rb'] + s.extra_rdoc_files
  s.test_files    = %w{spec}
  s.require_paths = %w{lib}

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_dependency 'actionmailer', '>= 3.0.0'
  s.add_dependency 'createsend', '~> 5.0.0'

  s.add_development_dependency 'byebug', '8.2.1'
  s.add_development_dependency 'mime-types', '~> 1.25.1'
  s.add_development_dependency 'pry-byebug', '3.3.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '0.37.2'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'simplecov', '~> 0.13.0'
end
