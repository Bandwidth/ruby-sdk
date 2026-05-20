# Unit tests for Bandwidth::TelephoneNumber
describe Bandwidth::TelephoneNumber do
  let(:telephone_number_default) { Bandwidth::TelephoneNumber.new }
  let(:telephone_number_values) { Bandwidth::TelephoneNumber.new({
    telephone_number: '+19195551234'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TelephoneNumber.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TelephoneNumber.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TelephoneNumber.acceptable_attributes).to eq(Bandwidth::TelephoneNumber.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::TelephoneNumber.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TelephoneNumber created by the build_from_hash method' do
      telephone_number_from_hash = Bandwidth::TelephoneNumber.build_from_hash({
        telephoneNumber: '+19195551234'
      })
      expect(telephone_number_from_hash).to be_instance_of(Bandwidth::TelephoneNumber)
      expect(telephone_number_from_hash.telephone_number).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(telephone_number_values.to_s).to eq('{:telephoneNumber=>"+19195551234"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(telephone_number_default.eql?(Bandwidth::TelephoneNumber.new)).to be true
      expect(telephone_number_default.eql?(telephone_number_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(telephone_number_values.to_body).to eq({
        telephoneNumber: '+19195551234'
      })
    end
  end
end
