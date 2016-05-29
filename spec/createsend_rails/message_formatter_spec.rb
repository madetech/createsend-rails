describe CreateSendRails::MessageFormatter do
  subject { described_class.new(message).format }
  let(:message) { double(to: 'user@example.com',
                         cc: ['joe@bloggs.com', 'john@bloggs.com']) }

  it 'expects to include the message recipients' do
    expected_recipients = {'To' => 'user@example.com',
                           'CC' =>  ['joe@bloggs.com', 'john@bloggs.com']}

    expect(subject).to eq(expected_recipients)
  end

  context 'when the message includes JSON body' do
    let(:message) do
      double(to: 'user@example.com', body: {'reset_url' => 'http:://localhost/en/reset'}.to_json)
    end

    it { is_expected.to include(:reset_url) }
  end

  context 'expects to remove empty key values' do
    let(:message) do
      double(to: 'user@example.com')
    end

    it { is_expected.to_not include(:CC) }
  end
end