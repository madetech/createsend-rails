module CreatesendRails
  class SmartEmailFormatter
    def format
      request_body.deep_reject! { |_k, v| v.blank? }
    end

    private

    def initialize(message)
      @message = message
    end

    def request_body
      recipients.merge!(data: values)
    end

    def recipients
      {
        to: @message.to,
        cc: @message.cc,
        bcc: @message.bcc,
        ConsentToTrack: values.try(:[], :consent_to_track) || 'Yes' # That's not clean, should find better way?
      }.symbolize_keys!
    end

    def values
      return if @message.try(:body).empty?
      JSON.parse(@message.try(:body).try(:encoded)).symbolize_keys!
    end
  end
end
