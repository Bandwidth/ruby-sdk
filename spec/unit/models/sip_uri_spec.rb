describe Bandwidth::SipUri do
  it 'initializes with valid value' do
    model = Bandwidth::SipUri.new(sip_uri: 'sip:alice@atlanta.example.com')
    expect(model.sip_uri).to eq('sip:alice@atlanta.example.com')
  end

  it 'raises on invalid attribute' do
    expect { Bandwidth::SipUri.new(invalid: true) }.to raise_error(ArgumentError)
  end

  it 'builds from hash and serializes' do
    model = Bandwidth::SipUri.build_from_hash({ sipUri: 'sip:alice@atlanta.example.com' })
    expect(model.to_hash).to eq({ sipUri: 'sip:alice@atlanta.example.com' })
  end
end