module CreateSendRails
  class Deliverer
    attr_accessor :settings

    def initialize(values)
      settings = {}.merge(values)
    end

    def deliver!(message)
      auth = settings.dup
      smart_data = MessageFormatter.new(message).format

      tx_smart_email = ::CreateSend::Transactional::SmartEmail.new(auth, smart_email_id)
      tx_smart_email.send(smart_data)
      self
    end

    private

    def smart_email_id
      '2112cb2a-8fc7-42c1-a8b2-f7eecfa2d029'
    end
  end
end
