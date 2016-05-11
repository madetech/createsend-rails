module CreatesendRails
  class Mailer
    attr_accessor :settings

    def initialize(values)
      self.settings = { api_key: '46205f6517c40b9729a62c9e44358b7757ef16921d5cc380:x' }.merge(values)
    end

    def deliver!(mail)
      settings = self.settings.dup
      smart_email_id = 'e300404b-43a5-4ca6-99f4-5ac8b619a9df'

      tx_smart_mailer = CreateSend::Transactional::SmartEmail.new(settings, smart_email_id)
      message = {
        'To' => "rory@madetech.co.uk",
        'Data' => {
          'Url' => "www.google.com",
          'Locale' => "en"
        }
      }
      response = tx_smart_mailer.send(message)
    end
  end
end
