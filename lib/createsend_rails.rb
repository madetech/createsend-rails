require 'action_mailer'
require 'createsend'
require 'createsend_rails/mailer'

module CreatesendRails
  extend self

  def install
    ActionMailer::Base.add_delivery_method :create_send, CreatesendRails::Mailer
  end
end

if defined?(Rails)
  require 'createsend_rails/railtie'
else
  CreatesendRails.install
end
