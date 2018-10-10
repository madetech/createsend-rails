module CreateSendRails
  class Deliverer
    attr_accessor :settings

    def initialize(values)
      self.settings = {}.merge(values)
    end

    def deliver!(mail)
      @mail = mail
      puts 'BLEP'
      smart_email = ::CreateSend::Transactional::SmartEmail.new(auth, smart_email_id)
      puts 'AUTH'
      puts auth.to_s
      smart_email.send(mail_data)
      puts mail_data.to_s
    end

    private

    def auth
      settings.dup
    end

    def mail_data
      SmartEmailFormatter.new(@mail).format
    end

    def smart_email_id
      mail_data[:data][:smart_email_id]
    end
  end
end
