# Unit tests for Bandwidth::VerifyCodeRequest
describe Bandwidth::VerifyCodeRequest do
  let(:verify_code_request_default) { Bandwidth::VerifyCodeRequest.new }
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
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::VerifyCodeRequest.new({ invalid: true })
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
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

  describe '#list_invalid_properties' do
    it 'returns list of invalid properties' do
      expect(verify_code_request_values.list_invalid_properties).to eq([])
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

  describe '#valid?' do
    it 'validates instances with and without attributes set' do
      expect(verify_code_request_values).to be_valid
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(verify_code_request_default.eql?(Bandwidth::VerifyCodeRequest.new)).to be true
      expect(verify_code_request_default.eql?(verify_code_request_values)).to be false
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
end
