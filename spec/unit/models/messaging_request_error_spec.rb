# Unit tests for Bandwidth::MessagingRequestError
describe Bandwidth::MessagingRequestError do
  let(:messaging_request_error_default) { Bandwidth::MessagingRequestError.new({
    type: 'baseline',
    description: 'baseline description'
  }) }
  let(:messaging_request_error_values) { Bandwidth::MessagingRequestError.new({
    type: 'validation',
    description: 'bad input'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MessagingRequestError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MessagingRequestError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MessagingRequestError.acceptable_attributes).to eq(Bandwidth::MessagingRequestError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MessagingRequestError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MessagingRequestError created by the build_from_hash method' do
      messaging_request_error_from_hash = Bandwidth::MessagingRequestError.build_from_hash({
        type: 'validation',
        description: 'bad input'
      })
      expect(messaging_request_error_from_hash).to be_instance_of(Bandwidth::MessagingRequestError)
      expect(messaging_request_error_from_hash.type).to eq('validation')
      expect(messaging_request_error_from_hash.description).to eq('bad input')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(messaging_request_error_values.to_s).to eq('{:type=>"validation", :description=>"bad input"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      messaging_request_error_equal = Bandwidth::MessagingRequestError.new({
        type: 'baseline',
        description: 'baseline description'
      })
      expect(messaging_request_error_default.eql?(messaging_request_error_equal)).to be true
      expect(messaging_request_error_default.eql?(messaging_request_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(messaging_request_error_values.to_body).to eq({
        type: 'validation',
        description: 'bad input'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::MessagingRequestError.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#description=' do
      expect {
        Bandwidth::MessagingRequestError.new({ type: 'a', description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end
  end
end
