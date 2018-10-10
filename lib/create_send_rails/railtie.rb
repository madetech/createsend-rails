module CreateSendRails
  class Railtie < Rails::Railtie
    puts "BLEEEEP"
    initializer 'railtie.createsend-rails' do
      puts "BLEP"
      CreateSendRails.install
    end
  end
end
