require 'spec_helper'

describe CreateSendRails::MessageFormatter do
  subject { described_class.new(message).format }
  let(:message) { double(to: 'user@example.com',
                         cc: ['joe@bloggs.com', 'john@bloggs.com']) }

  it 'expects to include the message recipients' do
    expected_recipients = {'To' => 'user@example.com',
                           'CC' =>  ['joe@bloggs.com', 'john@bloggs.com']}

    expect(subject).to eq(expected_recipients)
  end

  it 'expects to include the JSON body as keys' do
    let(:message) { double(to: 'user@example.com',
                           body: {'reset_url' => 'http:://localhost/en/reset'}.to_json) }
    subject.should include(:reset_url)
  end

  it 'expects to remove empty key values' do
    let(:message) { double(to: 'user@example.com') }
    subject.should_not include(:CC)
  end

end