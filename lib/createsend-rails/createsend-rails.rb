require 'action_mailer'

module CreatesendRails
  extend self

  def install
    ActionMailer::Base.add_delivery_method :create_send, CreatesendRails::Transaction
  end
end

if defined?(Rails)
  require 'CreatesendRails-rails/railtie'
else
  CreatesendRails.install
end
