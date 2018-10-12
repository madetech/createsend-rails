require 'action_mailer'
require 'createsend-rails/deliverer'
require 'createsend-rails/ext/action_mailer'
require 'createsend-rails/ext/hash'
require 'createsend-rails/smart_email_formatter'

module CreatesendRails
  def self.install
    puts "INSTALLED"
    ActionMailer::Base.include(CreatesendRails::SmartEmailer)
    ActionMailer::Base.include(CreatesendRails::ViewDefaults)
    ActionMailer::Base.add_delivery_method :create_send, CreatesendRails::Deliverer
  end
end
puts "REQUIRED"
if defined?(Rails)
  puts "RAILS DEFINED"
  require 'createsend-rails/railtie'
else
  puts "RAILS UNDEFINED"
  CreatesendRails.install
end
