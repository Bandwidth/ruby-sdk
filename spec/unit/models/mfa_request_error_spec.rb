# Unit tests for Bandwidth::MfaRequestError
describe Bandwidth::MfaRequestError do
  let(:mfa_request_error_default) { Bandwidth::MfaRequestError.new }
  let(:mfa_request_error_values) { Bandwidth::MfaRequestError.new({
    error: 'Invalid request',
    request_id: 'req-abc-123'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MfaRequestError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MfaRequestError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MfaRequestError.acceptable_attributes).to eq(Bandwidth::MfaRequestError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MfaRequestError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MfaRequestError created by the build_from_hash method' do
      mfa_request_error_from_hash = Bandwidth::MfaRequestError.build_from_hash({
        error: 'Invalid request',
        requestId: 'req-abc-123'
      })
      expect(mfa_request_error_from_hash).to be_instance_of(Bandwidth::MfaRequestError)
      expect(mfa_request_error_from_hash.error).to eq('Invalid request')
      expect(mfa_request_error_from_hash.request_id).to eq('req-abc-123')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(mfa_request_error_values.to_s).to eq('{:error=>"Invalid request", :requestId=>"req-abc-123"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(mfa_request_error_default.eql?(Bandwidth::MfaRequestError.new)).to be true
      expect(mfa_request_error_default.eql?(mfa_request_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(mfa_request_error_values.to_body).to eq({
        error: 'Invalid request',
        requestId: 'req-abc-123'
      })
    end
  end
end
