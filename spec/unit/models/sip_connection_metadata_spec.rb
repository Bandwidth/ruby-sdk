# Unit tests for Bandwidth::SipConnectionMetadata
describe Bandwidth::SipConnectionMetadata do
  let(:sip_connection_metadata_default) { Bandwidth::SipConnectionMetadata.new }
  let(:sip_connection_metadata_values) { Bandwidth::SipConnectionMetadata.new({
    ip_address: '192.168.1.1',
    port: 5060,
    credentials: Bandwidth::SipCredentials.new({ username: 'sipUser', password: 'sipPass' }),
    uui_header: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::SipConnectionMetadata.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::SipConnectionMetadata.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::SipConnectionMetadata.acceptable_attributes).to eq(Bandwidth::SipConnectionMetadata.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::SipConnectionMetadata.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of SipConnectionMetadata created by the build_from_hash method' do
      sip_connection_metadata_from_hash = Bandwidth::SipConnectionMetadata.build_from_hash({
        ipAddress: '192.168.1.1',
        port: 5060,
        credentials: { username: 'sipUser', password: 'sipPass' },
        uuiHeader: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'
      })
      expect(sip_connection_metadata_from_hash).to be_instance_of(Bandwidth::SipConnectionMetadata)
      expect(sip_connection_metadata_from_hash.ip_address).to eq('192.168.1.1')
      expect(sip_connection_metadata_from_hash.port).to eq(5060)
      expect(sip_connection_metadata_from_hash.credentials).to be_instance_of(Bandwidth::SipCredentials)
      expect(sip_connection_metadata_from_hash.credentials.username).to eq('sipUser')
      expect(sip_connection_metadata_from_hash.credentials.password).to eq('sipPass')
      expect(sip_connection_metadata_from_hash.uui_header).to eq('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(sip_connection_metadata_values.to_s).to eq('{:ipAddress=>"192.168.1.1", :port=>5060, :credentials=>{:username=>"sipUser", :password=>"sipPass"}, :uuiHeader=>"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(sip_connection_metadata_default.eql?(Bandwidth::SipConnectionMetadata.new)).to be true
      expect(sip_connection_metadata_default.eql?(sip_connection_metadata_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(sip_connection_metadata_values.to_body).to eq({
        ipAddress: '192.168.1.1',
        port: 5060,
        credentials: { username: 'sipUser', password: 'sipPass' },
        uuiHeader: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'
      })
    end
  end
end
