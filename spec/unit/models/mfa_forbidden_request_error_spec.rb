# Unit tests for Bandwidth::MfaForbiddenRequestError
describe Bandwidth::MfaForbiddenRequestError do
  let(:mfa_forbidden_request_error_default) { Bandwidth::MfaForbiddenRequestError.new }
  let(:mfa_forbidden_request_error_values) { Bandwidth::MfaForbiddenRequestError.new({
    message: 'Forbidden request'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MfaForbiddenRequestError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MfaForbiddenRequestError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MfaForbiddenRequestError.acceptable_attributes).to eq(Bandwidth::MfaForbiddenRequestError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MfaForbiddenRequestError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MfaForbiddenRequestError created by the build_from_hash method' do
      mfa_forbidden_request_error_from_hash = Bandwidth::MfaForbiddenRequestError.build_from_hash({
        message: 'Forbidden request'
      })
      expect(mfa_forbidden_request_error_from_hash).to be_instance_of(Bandwidth::MfaForbiddenRequestError)
      expect(mfa_forbidden_request_error_from_hash.message).to eq('Forbidden request')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(mfa_forbidden_request_error_values.to_s).to eq('{:message=>"Forbidden request"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(mfa_forbidden_request_error_default.eql?(Bandwidth::MfaForbiddenRequestError.new)).to be true
      expect(mfa_forbidden_request_error_default.eql?(mfa_forbidden_request_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(mfa_forbidden_request_error_values.to_body).to eq({
        message: 'Forbidden request'
      })
    end
  end
end
