module CreateSendRails
  module SmartEmailer
    def smart_mail(headers = {}, &block)
      self.mail(headers, block)
    end
  end
  module ViewDefaults

  end
end
