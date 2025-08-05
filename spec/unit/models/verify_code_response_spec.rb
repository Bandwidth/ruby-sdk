# Unit tests for Bandwidth::VerifyCodeResponse
describe Bandwidth::VerifyCodeResponse do
  let(:verify_code_response_default) { Bandwidth::VerifyCodeResponse.new }
  let(:verify_code_response_values) { Bandwidth::VerifyCodeResponse.new({
    valid: true
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VerifyCodeResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerifyCodeResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VerifyCodeResponse.acceptable_attributes).to eq(Bandwidth::VerifyCodeResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::VerifyCodeResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VerifyCodeResponse created by the build_from_hash method' do
      verify_code_response_from_hash = Bandwidth::VerifyCodeResponse.build_from_hash({
        valid: true
      })
      expect(verify_code_response_from_hash).to be_instance_of(Bandwidth::VerifyCodeResponse)
      expect(verify_code_response_from_hash.valid).to be true
    end
  end
  
  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(verify_code_response_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(verify_code_response_values.to_s).to eq('{:valid=>true}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(verify_code_response_default.eql?(Bandwidth::VerifyCodeResponse.new)).to be true
      expect(verify_code_response_default.eql?(verify_code_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(verify_code_response_values.to_body).to eq({
        valid: true
      })
    end
  end
end
