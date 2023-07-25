# Unit tests for Bandwidth::VerifyCodeRequest
describe Bandwidth::VerifyCodeRequest do
  let(:verify_code_request_values) { Bandwidth::VerifyCodeRequest.new({
    to: '+19195551234',
    scope: '2FA',
    expiration_time_in_minutes: 1.0,
    code: '123456'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::VerifyCodeRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerifyCodeRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::VerifyCodeRequest.acceptable_attributes).to eq(Bandwidth::VerifyCodeRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::VerifyCodeRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of VerifyCodeRequest created by the build_from_hash method' do
      verify_code_request_from_hash = Bandwidth::VerifyCodeRequest.build_from_hash({
        to: '+19195551234',
        scope: '2FA',
        expirationTimeInMinutes: 1.0,
        code: '123456'
      })
      expect(verify_code_request_from_hash).to be_instance_of(Bandwidth::VerifyCodeRequest)
      expect(verify_code_request_from_hash.to).to eq('+19195551234')
      expect(verify_code_request_from_hash.scope).to eq('2FA')
      expect(verify_code_request_from_hash.expiration_time_in_minutes).to eq(1.0)
      expect(verify_code_request_from_hash.code).to eq('123456')
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(verify_code_request_values.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(verify_code_request_values.to_s).to eq('{:to=>"+19195551234", :scope=>"2FA", :expirationTimeInMinutes=>1.0, :code=>"123456"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      verify_code_request_equal = Bandwidth::VerifyCodeRequest.new({
        to: '+19195551234',
        scope: '2FA',
        expiration_time_in_minutes: 1.0,
        code: '123456'
      })
      expect(verify_code_request_equal.eql?(verify_code_request_values)).to be true
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(verify_code_request_values.to_body).to eq({
        to: '+19195551234',
        scope: '2FA',
        expirationTimeInMinutes: 1.0,
        code: '123456'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#to=' do
      expect {
        Bandwidth::VerifyCodeRequest.new({ to: nil })
      }.to raise_error(ArgumentError, 'to cannot be nil')

      expect {
        Bandwidth::VerifyCodeRequest.new({ to: 'invalid' })
      }.to raise_error(ArgumentError, 'invalid value for "to", must conform to the pattern (?-mix:^\+[1-9]\d{1,14}$).')
    end

    it '#expiration_time_in_minutes=' do
      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: nil })
      }.to raise_error(ArgumentError, 'expiration_time_in_minutes cannot be nil')

      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: 16 })
      }.to raise_error(ArgumentError, 'invalid value for "expiration_time_in_minutes", must be smaller than or equal to 15.')

      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: 0 })
      }.to raise_error(ArgumentError, 'invalid value for "expiration_time_in_minutes", must be greater than or equal to 1.')
    end

    it '#code=' do
      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: 1, code: nil })
      }.to raise_error(ArgumentError, 'code cannot be nil')

      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: 1, code: '123456789' })
      }.to raise_error(ArgumentError, 'invalid value for "code", the character length must be smaller than or equal to 8.')

      expect {
        Bandwidth::VerifyCodeRequest.new({ to: '+19195551234', expiration_time_in_minutes: 1, code: '123' })
      }.to raise_error(ArgumentError, 'invalid value for "code", the character length must be great than or equal to 4.')
    end
  end
end
