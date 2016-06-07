require 'action_mailer'
require_relative './create_send_rails/deliverer'
require_relative './create_send_rails/ext/action_mailer'
require_relative './create_send_rails/ext/hash'
require_relative './create_send_rails/smart_email_formatter'

module CreateSendRails
  extend self

  def install
    ActionMailer::Base.include(CreateSendRails::SmartEmailer)
    ActionMailer::Base.include(CreateSendRails::ViewDefaults)
    ActionMailer::Base.add_delivery_method :create_send, CreateSendRails::Deliverer
  end
end

if defined?(Rails)
  require_relative './create_send_rails/railtie'
else
  CreateSendRails.install
end
