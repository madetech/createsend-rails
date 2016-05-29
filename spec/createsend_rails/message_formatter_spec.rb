describe CreateSendRails::MessageFormatter do
  subject { described_class.new(message).format }
  let(:message) {
    Mail::Message.new(to: 'user@example.com',
                      cc: ['joe@bloggs.com', 'john@bloggs.com'],
                      body: {reset_url: 'http:://localhost/en/reset'}.to_json,
                      subject: 'subject')
  }

  it 'expects to include the message recipients' do
    expected_recipients = {to: 'user@example.com',
                           cc: ['joe@bloggs.com', 'john@bloggs.com']}

    expect(subject).to eq(expected_recipients)
  end

  context 'when the message includes JSON body' do
    it { is_expected.to include(:reset_url) }
  end

  context 'expects to remove empty key values' do
    let(:message) do
      double(to: 'user@example.com')
    end

    it { is_expected.to_not include(:cc) }
  end
end