$:.push File.expand_path("../lib", __FILE__)
require "create_send_rails/version"

Gem::Specification.new do |s|
  s.name = %q{createsend-rails}
  s.version = CreateSendRails::VERSION
  s.authors = ["Andrew Scott"]
  s.description = %q{}
  s.email = %q{andrew@madetech.com}
  s.homepage = %q{}
  s.summary = %q{Campaign Monitor transactional email adapter for ActionMailer}

  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.rdoc_options = ["--charset=UTF-8"]

  s.add_dependency('actionmailer', ">= 3.0.0")
  s.add_dependency('createsend', "4.1.0")
  s.add_development_dependency('rake')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
end