# Unit tests for Bandwidth::CreateMessageRequestError
describe Bandwidth::CreateMessageRequestError do
  let(:create_message_request_error_default) { Bandwidth::CreateMessageRequestError.new({
    type: 'baseline-type',
    description: 'baseline description'
  }) }
  let(:create_message_request_error_values) { Bandwidth::CreateMessageRequestError.new({
    type: 'request-validation',
    description: 'Your request could not be processed.',
    field_errors: [Bandwidth::FieldError.new({ field_name: 'to', description: 'must be present' })]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateMessageRequestError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateMessageRequestError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateMessageRequestError.acceptable_attributes).to eq(Bandwidth::CreateMessageRequestError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::CreateMessageRequestError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateMessageRequestError created by the build_from_hash method' do
      create_message_request_error_from_hash = Bandwidth::CreateMessageRequestError.build_from_hash({
        type: 'request-validation',
        description: 'Your request could not be processed.',
        fieldErrors: [{ fieldName: 'to', description: 'must be present' }]
      })
      expect(create_message_request_error_from_hash).to be_instance_of(Bandwidth::CreateMessageRequestError)
      expect(create_message_request_error_from_hash.type).to eq('request-validation')
      expect(create_message_request_error_from_hash.description).to eq('Your request could not be processed.')
      expect(create_message_request_error_from_hash.field_errors.first).to be_instance_of(Bandwidth::FieldError)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_message_request_error_values.to_s).to eq('{:type=>"request-validation", :description=>"Your request could not be processed.", :fieldErrors=>[{:fieldName=>"to", :description=>"must be present"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_message_request_error_equal = Bandwidth::CreateMessageRequestError.new({
        type: 'baseline-type',
        description: 'baseline description'
      })
      expect(create_message_request_error_default.eql?(create_message_request_error_equal)).to be true
      expect(create_message_request_error_default.eql?(create_message_request_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_message_request_error_values.to_body).to eq({
        type: 'request-validation',
        description: 'Your request could not be processed.',
        fieldErrors: [{ fieldName: 'to', description: 'must be present' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::CreateMessageRequestError.new({ type: nil, description: 'a' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#description=' do
      expect {
        Bandwidth::CreateMessageRequestError.new({ type: 'a', description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end
  end
end
