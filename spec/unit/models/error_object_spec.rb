# Unit tests for Bandwidth::ErrorObject
describe Bandwidth::ErrorObject do
  let(:error_source) { Bandwidth::ErrorSource.new({ field: 'phoneNumber' }) }
  let(:error_object_default) { Bandwidth::ErrorObject.new({
    type: 'baseline',
    description: 'baseline description',
    source: error_source
  }) }
  let(:error_object_values) { Bandwidth::ErrorObject.new({
    type: 'validation',
    description: 'bad input',
    source: error_source
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ErrorObject.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ErrorObject.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ErrorObject.acceptable_attributes).to eq(Bandwidth::ErrorObject.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::ErrorObject.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ErrorObject created by the build_from_hash method' do
      error_object_from_hash = Bandwidth::ErrorObject.build_from_hash({
        type: 'validation',
        description: 'bad input',
        source: { field: 'phoneNumber' }
      })
      expect(error_object_from_hash).to be_instance_of(Bandwidth::ErrorObject)
      expect(error_object_from_hash.type).to eq('validation')
      expect(error_object_from_hash.description).to eq('bad input')
      expect(error_object_from_hash.source).to be_instance_of(Bandwidth::ErrorSource)
      expect(error_object_from_hash.source.field).to eq('phoneNumber')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(error_object_values.to_s).to eq('{:type=>"validation", :description=>"bad input", :source=>{:field=>"phoneNumber"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      error_object_equal = Bandwidth::ErrorObject.new({
        type: 'baseline',
        description: 'baseline description',
        source: error_source
      })
      expect(error_object_default.eql?(error_object_equal)).to be true
      expect(error_object_default.eql?(error_object_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(error_object_values.to_body).to eq({
        type: 'validation',
        description: 'bad input',
        source: { field: 'phoneNumber' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::ErrorObject.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#description=' do
      expect {
        Bandwidth::ErrorObject.new({ type: 'a', description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end

    it '#source=' do
      expect {
        Bandwidth::ErrorObject.new({ type: 'a', description: 'b', source: nil })
      }.to raise_error(ArgumentError, 'source cannot be nil')
    end
  end
end
