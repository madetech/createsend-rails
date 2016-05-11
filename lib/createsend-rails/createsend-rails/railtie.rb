module CreatesendRails
  class Railtie < Rails::Railtie
    initializer 'CreatesendRails-rails', :before => 'action_mailer.set_configs' do
      ActiveSupport.on_load :action_mailer do
        CreatesendRails.install
      end
    end
  end
end
