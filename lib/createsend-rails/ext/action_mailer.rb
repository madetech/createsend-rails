module CreatesendRails
  module SmartEmailer
    def smart_mail(headers = {}, &block)
      mail(headers, block)
    end
  end

  module ViewDefaults
  end
end
