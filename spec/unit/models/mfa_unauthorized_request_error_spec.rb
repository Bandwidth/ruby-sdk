# Unit tests for Bandwidth::MfaUnauthorizedRequestError
describe Bandwidth::MfaUnauthorizedRequestError do
  let(:mfa_unauthorized_request_error_default) { Bandwidth::MfaUnauthorizedRequestError.new }
  let(:mfa_unauthorized_request_error_values) { Bandwidth::MfaUnauthorizedRequestError.new({
    message: 'Unauthorized'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MfaUnauthorizedRequestError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MfaUnauthorizedRequestError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MfaUnauthorizedRequestError.acceptable_attributes).to eq(Bandwidth::MfaUnauthorizedRequestError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MfaUnauthorizedRequestError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MfaUnauthorizedRequestError created by the build_from_hash method' do
      mfa_unauthorized_request_error_from_hash = Bandwidth::MfaUnauthorizedRequestError.build_from_hash({
        message: 'Unauthorized'
      })
      expect(mfa_unauthorized_request_error_from_hash).to be_instance_of(Bandwidth::MfaUnauthorizedRequestError)
      expect(mfa_unauthorized_request_error_from_hash.message).to eq('Unauthorized')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(mfa_unauthorized_request_error_values.to_s).to eq('{:message=>"Unauthorized"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(mfa_unauthorized_request_error_default.eql?(Bandwidth::MfaUnauthorizedRequestError.new)).to be true
      expect(mfa_unauthorized_request_error_default.eql?(mfa_unauthorized_request_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(mfa_unauthorized_request_error_values.to_body).to eq({
        message: 'Unauthorized'
      })
    end
  end
end
