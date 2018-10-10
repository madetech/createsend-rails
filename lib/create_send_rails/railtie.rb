module CreateSendRails
  class Railtie < Rails::Railtie
    initializer 'railtie.createsend-rails' do
      CreateSendRails.install
    end
  end
end
