# Unit tests for Bandwidth::LookupErrorSchema
describe Bandwidth::LookupErrorSchema do
  let(:lookup_error_schema_default) { Bandwidth::LookupErrorSchema.new({
    code: '400',
    description: 'baseline description',
    type: 'baseline'
  }) }
  let(:lookup_error_schema_values) { Bandwidth::LookupErrorSchema.new({
    code: '404',
    description: 'not found',
    type: 'validation',
    meta: Bandwidth::LookupErrorSchemaMeta.new({ phone_numbers: ['+19195551234'], message: 'invalid', code: 404 })
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LookupErrorSchema.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LookupErrorSchema.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LookupErrorSchema.acceptable_attributes).to eq(Bandwidth::LookupErrorSchema.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LookupErrorSchema.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LookupErrorSchema created by the build_from_hash method' do
      lookup_error_schema_from_hash = Bandwidth::LookupErrorSchema.build_from_hash({
        code: '404',
        description: 'not found',
        type: 'validation',
        meta: { phoneNumbers: ['+19195551234'], message: 'invalid', code: 404 }
      })
      expect(lookup_error_schema_from_hash).to be_instance_of(Bandwidth::LookupErrorSchema)
      expect(lookup_error_schema_from_hash.code).to eq('404')
      expect(lookup_error_schema_from_hash.description).to eq('not found')
      expect(lookup_error_schema_from_hash.type).to eq('validation')
      expect(lookup_error_schema_from_hash.meta).to be_instance_of(Bandwidth::LookupErrorSchemaMeta)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(lookup_error_schema_values.to_s).to eq('{:code=>"404", :description=>"not found", :type=>"validation", :meta=>{:phoneNumbers=>["+19195551234"], :message=>"invalid", :code=>404}}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      lookup_error_schema_equal = Bandwidth::LookupErrorSchema.new({
        code: '400',
        description: 'baseline description',
        type: 'baseline'
      })
      expect(lookup_error_schema_default.eql?(lookup_error_schema_equal)).to be true
      expect(lookup_error_schema_default.eql?(lookup_error_schema_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(lookup_error_schema_values.to_body).to eq({
        code: '404',
        description: 'not found',
        type: 'validation',
        meta: { phoneNumbers: ['+19195551234'], message: 'invalid', code: 404 }
      })
    end
  end

  describe 'custom attribute writers' do
    it '#code=' do
      expect {
        Bandwidth::LookupErrorSchema.new({ code: nil })
      }.to raise_error(ArgumentError, 'code cannot be nil')
    end

    it '#description=' do
      expect {
        Bandwidth::LookupErrorSchema.new({ code: '400', description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')
    end

    it '#type=' do
      expect {
        Bandwidth::LookupErrorSchema.new({ code: '400', description: 'a', type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end
  end
end
