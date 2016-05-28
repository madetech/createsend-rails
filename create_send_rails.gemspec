$:.push File.expand_path('../lib', __FILE__)
require 'create_send_rails/version'

Gem::Specification.new do |s|
  s.name = %q{createsend-rails}
  s.version = CreateSendRails::VERSION
  s.authors = ['Andrew Scott', 'Rory MacDonald']
  s.description = %q{}
  s.email = %w{andrew@madetech.co.uk rory@madetech.co.uk}
  s.homepage = 'https://github.com/madetech/createsend-rails'
  s.summary = %q{Campaign Monitor transactional email adapter for ActionMailer}

  s.extra_rdoc_files = %w{
    LICENSE
    README.md
  }

  s.rdoc_options = %w{--charset=UTF-8}

  s.files         = Dir['{lib,spec}/**/*.rb'] + s.extra_rdoc_files
  s.test_files    = %w{spec}
  s.require_paths = %w{lib}

  s.add_dependency('actionmailer', '>= 3.0.0')
  s.add_dependency('createsend', '4.1.0')

  s.add_development_dependency('mime-types', '~> 1.25.1')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.14.0')
  s.add_development_dependency('simplecov', '~> 0.7.1')
end