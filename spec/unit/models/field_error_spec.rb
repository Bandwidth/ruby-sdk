# Unit tests for Bandwidth::FieldError
describe Bandwidth::FieldError do
  let(:field_error_default) { Bandwidth::FieldError.new }
  let(:field_error_values) { Bandwidth::FieldError.new({
    field_name: 'to',
    description: 'invalid phone number'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::FieldError.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::FieldError.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::FieldError.acceptable_attributes).to eq(Bandwidth::FieldError.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::FieldError.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of FieldError created by the build_from_hash method' do
      field_error_from_hash = Bandwidth::FieldError.build_from_hash({
        fieldName: 'to',
        description: 'invalid phone number'
      })
      expect(field_error_from_hash).to be_instance_of(Bandwidth::FieldError)
      expect(field_error_from_hash.field_name).to eq('to')
      expect(field_error_from_hash.description).to eq('invalid phone number')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(field_error_values.to_s).to eq('{:fieldName=>"to", :description=>"invalid phone number"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(field_error_default.eql?(Bandwidth::FieldError.new)).to be true
      expect(field_error_default.eql?(field_error_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(field_error_values.to_body).to eq({
        fieldName: 'to',
        description: 'invalid phone number'
      })
    end
  end
end
