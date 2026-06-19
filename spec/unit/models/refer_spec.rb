describe Bandwidth::Refer do
  let(:sip_uri) { Bandwidth::SipUri.new(sip_uri: 'sip:alice@atlanta.example.com') }

  it 'initializes and serializes with valid attributes' do
    model = Bandwidth::Refer.new(
      refer_complete_url: 'https://example.com/referComplete',
      refer_complete_method: Bandwidth::ReferCompleteMethodEnum::POST,
      tag: 'custom-tag',
      sip_uri: sip_uri
    )

    expect(model.to_hash).to eq({
      referCompleteUrl: 'https://example.com/referComplete',
      referCompleteMethod: 'POST',
      tag: 'custom-tag',
      sipUri: { sipUri: 'sip:alice@atlanta.example.com' }
    })
  end

  it 'requires sip_uri' do
    expect {
      Bandwidth::Refer.new(refer_complete_method: 'POST')
    }.to raise_error(ArgumentError)
  end

  it 'rejects invalid method enum' do
    expect {
      Bandwidth::Refer.new(sip_uri: sip_uri, refer_complete_method: 'PUT')
    }.to raise_error(RuntimeError)
  end

  it 'rejects invalid attributes' do
    expect {
      Bandwidth::Refer.new(sip_uri: sip_uri, invalid: true)
    }.to raise_error(ArgumentError)
  end

  it 'builds from hash' do
    model = Bandwidth::Refer.build_from_hash({
      referCompleteUrl: 'https://example.com/referComplete',
      referCompleteMethod: 'GET',
      tag: 'x',
      sipUri: { sipUri: 'sip:alice@atlanta.example.com' }
    })

    expect(model.refer_complete_method).to eq('GET')
    expect(model.sip_uri.sip_uri).to eq('sip:alice@atlanta.example.com')
  end
end