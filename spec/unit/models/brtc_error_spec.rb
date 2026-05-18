# Unit tests for Bandwidth::BrtcError
describe Bandwidth::BrtcError do
  let(:brtc_error_default) { Bandwidth::BrtcError.new({
    type: 'baseline',
    description: 'baseline description'
  }) }
  let(:brtc_error_values) { Bandwidth::BrtcError.new({
    id: 'abc-123',
    type: 'validation',
    description: 'bad input',
    code: 'E1001',
    source: Bandwidth::BrtcErrorSource.new({ field: 'phoneNumber' })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BrtcError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BrtcError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::BrtcError.acceptable_attributes).to eq(Bandwidth::BrtcError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::BrtcError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BrtcError created by the build_from_hash method' do
      brtc_error_from_hash = Bandwidth::BrtcError.build_from_hash({
        id: 'abc-123',
        type: 'validation',
        description: 'bad input',
        code: 'E1001',
        source: { field: 'phoneNumber' }
      })
      expect(brtc_error_from_hash).to be_instance_of(Bandwidth::BrtcError)
      expect(brtc_error_from_hash.id).to eq('abc-123')
      expect(brtc_error_from_hash.type).to eq('validation')
      expect(brtc_error_from_hash.description).to eq('bad input')
      expect(brtc_error_from_hash.code).to eq('E1001')
      expect(brtc_error_from_hash.source).to be_instance_of(Bandwidth::BrtcErrorSource)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(brtc_error_values.to_s).to eq('{:id=>"abc-123", :type=>"validation", :description=>"bad input", :code=>"E1001", :source=>{:field=>"phoneNumber"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      brtc_error_equal = Bandwidth::BrtcError.new({
        type: 'baseline',
        description: 'baseline description'
      })
      expect(brtc_error_default.eql?(brtc_error_equal)).to be true
      expect(brtc_error_default.eql?(brtc_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(brtc_error_values.to_body).to eq({
        id: 'abc-123',
        type: 'validation',
        description: 'bad input',
        code: 'E1001',
        source: { field: 'phoneNumber' }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::BrtcError.new({ type: nil, description: 'a' })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#description=' do
      expect {
        Bandwidth::BrtcError.new({ type: 'a', description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end
  end
end
