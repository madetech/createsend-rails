describe CreateSendRails::SmartEmailFormatter do
  subject { described_class.new(message).format }
  let(:template) { { reset_url: 'http:://localhost/en/reset' }.to_json }
  let(:message) {
    Mail::Message.new(to: 'user@example.com',
                      body: '',
                      cc: ['joe@bloggs.com', 'john@bloggs.com'],
                      subject: 'subject')
  }

  it 'include the message recipients' do
    expected_recipients = { to: ['user@example.com'],
                            cc: ['joe@bloggs.com', 'john@bloggs.com'] }

    expect(subject).to eq(expected_recipients)
  end

  context 'include message body' do
    let(:message) {
      Mail::Message.new(to: 'user@example.com',
                        body: template,
                        cc: ['joe@bloggs.com', 'john@bloggs.com'],
                        subject: 'subject')
    }

    it { expect(subject[:data]).to include(:reset_url) }
  end

  context 'remove empty key values' do
    let(:message) {
      Mail::Message.new(to: 'user@example.com',
                        body: template,
                        subject: 'subject')
    }

    it { expect(subject).to_not include(:cc) }
    it { expect(subject).to_not include(:bcc) }
    it { expect(subject).to_not include(:subject) }
  end
end
