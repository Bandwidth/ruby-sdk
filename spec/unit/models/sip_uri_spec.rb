describe Bandwidth::SipUri do
  it 'initializes with valid value' do
    model = Bandwidth::SipUri.new(uri: 'sip:alice@atlanta.example.com')
    expect(model.uri).to eq('sip:alice@atlanta.example.com')
  end

  it 'raises on invalid attribute' do
    expect { Bandwidth::SipUri.new(invalid: true) }.to raise_error(ArgumentError)
  end

  it 'builds from hash and serializes' do
    model = Bandwidth::SipUri.build_from_hash({ uri: 'sip:alice@atlanta.example.com' })
    expect(model.to_hash).to eq({ uri: 'sip:alice@atlanta.example.com' })
  end
end