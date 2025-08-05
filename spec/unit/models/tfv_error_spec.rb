# Unit tests for Bandwidth::TfvError
describe Bandwidth::TfvError do
  let(:tfv_error_default) { Bandwidth::TfvError.new }
  let(:tfv_error_values) { Bandwidth::TfvError.new({
    type: 'type',
    description: 'description',
    errors: { key: 'value' }
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TfvError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TfvError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TfvError.acceptable_attributes).to eq(Bandwidth::TfvError.attribute_map.values)
    end
  end

  describe 'enum validation' do
    it 'works' do
      
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TfvError created by the build_from_hash method' do
      tfv_error_from_hash = Bandwidth::TfvError.build_from_hash({
        type: 'type',
        description: 'description',
        errors: { key: 'value' }
      })
      expect(tfv_error_from_hash).to be_instance_of(Bandwidth::TfvError)
      expect(tfv_error_from_hash.type).to eq('type')
      expect(tfv_error_from_hash.description).to eq('description')
      expect(tfv_error_from_hash.errors).to eq({ key: 'value' })
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(tfv_error_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(tfv_error_values.to_s).to eq('{:type=>"type", :description=>"description", :errors=>{:key=>"value"}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(tfv_error_default.eql?(Bandwidth::TfvError.new)).to be true
      expect(tfv_error_default.eql?(tfv_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(tfv_error_values.to_body).to eq({
        type: 'type',
        description: 'description',
        errors: { key: 'value' }
      })
    end
  end
end
