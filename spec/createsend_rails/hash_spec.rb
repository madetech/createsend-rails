describe CreateSendRails::Hash do
  let(:simple_hash) { { a: 1, d: 2, e: nil } }
  let(:multi_hash) { { a: 5, d: 6, e: nil, f: { a: 1, b: '' } } }

  describe 'deep_reject!' do
    it 'removes empty objects from the top level' do
      simple_hash.deep_reject! { |_key, value| value.blank? }
      expect(simple_hash).to eq({ a: 1, d: 2 })
    end

    it 'removes empty objects from multidimensional levels' do
      multi_hash.deep_reject! { |_key, value| value.blank? }
      expect(multi_hash).to eq({ a: 5, d: 6, f: { a: 1 } })
    end
  end
end
