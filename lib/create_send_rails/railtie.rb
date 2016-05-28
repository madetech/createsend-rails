module CreateSendRails
  class Railtie < Rails::Railtie
    initializer 'createsend-rails', before: 'action_mailer.set_configs' do
      ActiveSupport.on_load :action_mailer do
        CreateSendRails.install
      end
    end
  end
end
