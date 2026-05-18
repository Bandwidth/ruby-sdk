# Unit tests for Bandwidth::SipCredentials
describe Bandwidth::SipCredentials do
  let(:sip_credentials_default) { Bandwidth::SipCredentials.new }
  let(:sip_credentials_values) { Bandwidth::SipCredentials.new({
    username: 'sipUser',
    password: 'sipPass'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::SipCredentials.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::SipCredentials.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::SipCredentials.acceptable_attributes).to eq(Bandwidth::SipCredentials.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::SipCredentials.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of SipCredentials created by the build_from_hash method' do
      sip_credentials_from_hash = Bandwidth::SipCredentials.build_from_hash({
        username: 'sipUser',
        password: 'sipPass'
      })
      expect(sip_credentials_from_hash).to be_instance_of(Bandwidth::SipCredentials)
      expect(sip_credentials_from_hash.username).to eq('sipUser')
      expect(sip_credentials_from_hash.password).to eq('sipPass')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(sip_credentials_values.to_s).to eq('{:username=>"sipUser", :password=>"sipPass"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(sip_credentials_default.eql?(Bandwidth::SipCredentials.new)).to be true
      expect(sip_credentials_default.eql?(sip_credentials_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(sip_credentials_values.to_body).to eq({
        username: 'sipUser',
        password: 'sipPass'
      })
    end
  end
end
