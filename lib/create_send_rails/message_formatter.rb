module CreateSendRails
  class MessageFormatter
    def format
      merged_data.deep_reject! { |k, v| v.blank? }
    end

    private
    def initialize(message)
      @message = message
    end

    def merged_data
      recipients.merge!({data: values}).symbolize_keys!
    end
    def values
      JSON.parse(@message.try(:body).try(:raw_source))
    end

    def recipients
      {
        'To' => "#{@message.to}",
        'CC' => "#{@message.cc}",
        'BCC' => "#{@message.bcc}"
      }
    end

  end
end