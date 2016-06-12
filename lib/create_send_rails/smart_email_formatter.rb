module CreateSendRails
  class SmartEmailFormatter
    def format
      request_body.deep_reject! { |_k, v| v.blank? }
    end

    private

    def initialize(message)
      @message = message
    end

    def request_body
      recipients.merge!({ data: values })
    end

    def recipients
      {
        to: @message.to,
        cc: @message.cc,
        bcc: @message.bcc
      }.symbolize_keys!
    end

    def values
      return if @message.try(:body).empty?
      JSON.parse(@message.try(:body).try(:raw_source)).symbolize_keys!
    end
  end
end
