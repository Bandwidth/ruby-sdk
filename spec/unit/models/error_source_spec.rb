# Unit tests for Bandwidth::ErrorSource
describe Bandwidth::ErrorSource do
  let(:error_source_default) { Bandwidth::ErrorSource.new }
  let(:error_source_values) { Bandwidth::ErrorSource.new({
    parameter: 'phoneNumber',
    field: 'to',
    header: 'X-Request-Id',
    reference: '/messages/123'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ErrorSource.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ErrorSource.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ErrorSource.acceptable_attributes).to eq(Bandwidth::ErrorSource.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::ErrorSource.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ErrorSource created by the build_from_hash method' do
      error_source_from_hash = Bandwidth::ErrorSource.build_from_hash({
        parameter: 'phoneNumber',
        field: 'to',
        header: 'X-Request-Id',
        reference: '/messages/123'
      })
      expect(error_source_from_hash).to be_instance_of(Bandwidth::ErrorSource)
      expect(error_source_from_hash.parameter).to eq('phoneNumber')
      expect(error_source_from_hash.field).to eq('to')
      expect(error_source_from_hash.header).to eq('X-Request-Id')
      expect(error_source_from_hash.reference).to eq('/messages/123')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(error_source_values.to_s).to eq('{:parameter=>"phoneNumber", :field=>"to", :header=>"X-Request-Id", :reference=>"/messages/123"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(error_source_default.eql?(Bandwidth::ErrorSource.new)).to be true
      expect(error_source_default.eql?(error_source_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(error_source_values.to_body).to eq({
        parameter: 'phoneNumber',
        field: 'to',
        header: 'X-Request-Id',
        reference: '/messages/123'
      })
    end
  end
end
