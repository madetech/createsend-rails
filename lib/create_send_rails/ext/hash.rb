module CreateSendRails
  module Hash
    def deep_reject(&block)
      dup.deep_reject!(&block)
    end

    def deep_reject!(&block)
      each do |key, value|
        value.deep_reject!(&block) if value.is_a?(Hash)
        delete(key) if yield(key, value)
      end
    end
  end
end

Hash.include(CreateSendRails::Hash)
