module CreateSendRails
  class MessageFormatter
    def format
      recipients.merge!({data: data}).compact!
    end

    private
    def initialize(message)
      @message = message
    end

    def data
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