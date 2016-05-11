require 'action_mailer'
require 'createsend'

module CreatesendRails
  extend self

  def install
    ActionMailer::Base.add_delivery_method :create_send, CreateSend::Transactional::SmartEmail
  end
end

if defined?(Rails)
  require 'createsend_rails/railtie'
else
  CreatesendRails.install
end
