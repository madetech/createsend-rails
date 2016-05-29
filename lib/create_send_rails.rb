require 'action_mailer'
require 'create_send_rails/action_mailer'
require 'create_send_rails/deliverer'
require 'create_send_rails/hash'
require 'create_send_rails/message_formatter'

module CreateSendRails
  extend self

  def install
    ActionMailer::Base.include(CreateSendRails::SmartEmailer)
    ActionMailer::Base.include(CreateSendRails::ViewDefaults)
    ActionMailer::Base.add_delivery_method :create_send, CreateSendRails::Deliverer
  end
end

if defined?(Rails)
  require 'create_send_rails/railtie'
else
  CreateSendRails.install
end