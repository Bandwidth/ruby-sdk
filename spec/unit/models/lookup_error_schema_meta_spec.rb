# Unit tests for Bandwidth::LookupErrorSchemaMeta
describe Bandwidth::LookupErrorSchemaMeta do
  let(:lookup_error_schema_meta_default) { Bandwidth::LookupErrorSchemaMeta.new }
  let(:lookup_error_schema_meta_values) { Bandwidth::LookupErrorSchemaMeta.new({
    phone_numbers: ['+19195551234'],
    message: 'invalid phone number',
    code: 400
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LookupErrorSchemaMeta.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LookupErrorSchemaMeta.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LookupErrorSchemaMeta.acceptable_attributes).to eq(Bandwidth::LookupErrorSchemaMeta.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LookupErrorSchemaMeta.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LookupErrorSchemaMeta created by the build_from_hash method' do
      lookup_error_schema_meta_from_hash = Bandwidth::LookupErrorSchemaMeta.build_from_hash({
        phoneNumbers: ['+19195551234'],
        message: 'invalid phone number',
        code: 400
      })
      expect(lookup_error_schema_meta_from_hash).to be_instance_of(Bandwidth::LookupErrorSchemaMeta)
      expect(lookup_error_schema_meta_from_hash.phone_numbers).to eq(['+19195551234'])
      expect(lookup_error_schema_meta_from_hash.message).to eq('invalid phone number')
      expect(lookup_error_schema_meta_from_hash.code).to eq(400)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(lookup_error_schema_meta_values.to_s).to eq('{:phoneNumbers=>["+19195551234"], :message=>"invalid phone number", :code=>400}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(lookup_error_schema_meta_default.eql?(Bandwidth::LookupErrorSchemaMeta.new)).to be true
      expect(lookup_error_schema_meta_default.eql?(lookup_error_schema_meta_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(lookup_error_schema_meta_values.to_body).to eq({
        phoneNumbers: ['+19195551234'],
        message: 'invalid phone number',
        code: 400
      })
    end
  end
end
