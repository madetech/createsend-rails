module CreateSendRails
  module Hash
    def deep_reject(&block)
      self.dup.deep_reject!(&block)
    end

    def deep_reject!(&block)
      self.each do |key, value|
        value.deep_reject!(&block) if value.is_a?(Hash)
        self.delete(key) if block.call(key, value)
      end
    end
  end
end

Hash.include(CreateSendRails::Hash)