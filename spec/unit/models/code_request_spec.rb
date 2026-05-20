# Unit tests for Bandwidth::CodeRequest
describe Bandwidth::CodeRequest do
  let(:code_request_default) { Bandwidth::CodeRequest.new({
    to: '+19195550100',
    from: '+19195550101',
    application_id: 'baseline-app',
    message: 'Your code is {CODE}',
    digits: 6
  }) }
  let(:code_request_values) { Bandwidth::CodeRequest.new({
    to: '+19195551234',
    from: '+19195554321',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    scope: '2FA',
    message: 'Your verification code is {CODE}',
    digits: 8
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CodeRequest.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CodeRequest.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CodeRequest.acceptable_attributes).to eq(Bandwidth::CodeRequest.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CodeRequest.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CodeRequest created by the build_from_hash method' do
      code_request_from_hash = Bandwidth::CodeRequest.build_from_hash({
        to: '+19195551234',
        from: '+19195554321',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        scope: '2FA',
        message: 'Your verification code is {CODE}',
        digits: 8
      })
      expect(code_request_from_hash).to be_instance_of(Bandwidth::CodeRequest)
      expect(code_request_from_hash.to).to eq('+19195551234')
      expect(code_request_from_hash.from).to eq('+19195554321')
      expect(code_request_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(code_request_from_hash.scope).to eq('2FA')
      expect(code_request_from_hash.message).to eq('Your verification code is {CODE}')
      expect(code_request_from_hash.digits).to eq(8)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(code_request_values.to_s).to eq('{:to=>"+19195551234", :from=>"+19195554321", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :scope=>"2FA", :message=>"Your verification code is {CODE}", :digits=>8}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      code_request_equal = Bandwidth::CodeRequest.new({
        to: '+19195550100',
        from: '+19195550101',
        application_id: 'baseline-app',
        message: 'Your code is {CODE}',
        digits: 6
      })
      expect(code_request_default.eql?(code_request_equal)).to be true
      expect(code_request_default.eql?(code_request_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(code_request_values.to_body).to eq({
        to: '+19195551234',
        from: '+19195554321',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        scope: '2FA',
        message: 'Your verification code is {CODE}',
        digits: 8
      })
    end
  end

  describe 'custom attribute writers' do
    it '#to=' do
      expect {
        Bandwidth::CodeRequest.new({ to: nil, from: '+19195554321', application_id: 'a', message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'to cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: 'invalid', from: '+19195554321', application_id: 'a', message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, /invalid value for "to", must conform to the pattern/)
    end

    it '#from=' do
      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: nil, application_id: 'a', message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'from cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+1' + '9' * 32, application_id: 'a', message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'invalid value for "from", the character length must be smaller than or equal to 32.')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: 'invalid', application_id: 'a', message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, /invalid value for "from", must conform to the pattern/)
    end

    it '#application_id=' do
      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: nil, message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a' * 51, message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'invalid value for "application_id", the character length must be smaller than or equal to 50.')
    end

    it '#scope=' do
      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', scope: nil, message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'scope cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', scope: 'a' * 26, message: 'm', digits: 6 })
      }.to raise_error(ArgumentError, 'invalid value for "scope", the character length must be smaller than or equal to 25.')
    end

    it '#message=' do
      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', message: nil, digits: 6 })
      }.to raise_error(ArgumentError, 'message cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', message: 'a' * 2049, digits: 6 })
      }.to raise_error(ArgumentError, 'invalid value for "message", the character length must be smaller than or equal to 2048.')
    end

    it '#digits=' do
      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', message: 'm', digits: nil })
      }.to raise_error(ArgumentError, 'digits cannot be nil')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', message: 'm', digits: 9 })
      }.to raise_error(ArgumentError, 'invalid value for "digits", must be smaller than or equal to 8.')

      expect {
        Bandwidth::CodeRequest.new({ to: '+19195551234', from: '+19195554321', application_id: 'a', message: 'm', digits: 3 })
      }.to raise_error(ArgumentError, 'invalid value for "digits", must be greater than or equal to 4.')
    end
  end
end
