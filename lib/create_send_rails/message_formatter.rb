module CreateSendRails
  class MessageFormatter
    def format
      merged_data.deep_reject! { |_k, v| v.blank? }
    end

    private

    def initialize(message)
      @message = message
    end

    def merged_data
      recipients.merge!({ data: values })
    end

    def recipients
      {
        to: @message.to.to_s,
        cc: @message.cc.to_s,
        bcc: @message.bcc.to_s
      }.symbolize_keys!
    end

    def values
      JSON.parse(@message.try(:body).try(:raw_source)).symbolize_keys!
    end
  end
end
