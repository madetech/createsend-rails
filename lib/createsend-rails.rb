require 'action_mailer'
require 'createsend-rails/deliverer'
require 'createsend-rails/ext/action_mailer'
require 'createsend-rails/ext/hash'
require 'createsend-rails/smart_email_formatter'

module CreatesendRails
  def self.install
    ActionMailer::Base.include(CreatesendRails::SmartEmailer)
    ActionMailer::Base.include(CreatesendRails::ViewDefaults)
    ActionMailer::Base.add_delivery_method :create_send, CreatesendRails::Deliverer
  end
end

if defined?(Rails)
  require 'createsend-rails/railtie'
else
  CreatesendRails.install
end
