# Unit tests for Bandwidth::StirShaken
describe Bandwidth::StirShaken do
  let(:stir_shaken_default) { Bandwidth::StirShaken.new }
  let(:stir_shaken_values) { Bandwidth::StirShaken.new({
    verstat: 'TN-Validation-Passed',
    attestation_indicator: 'A',
    originating_id: '99759086-1335-11ed-9bcf-5f7d464e91af'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::StirShaken.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::StirShaken.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::StirShaken.acceptable_attributes).to eq(Bandwidth::StirShaken.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::StirShaken.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of StirShaken created by the build_from_hash method' do
      stir_shaken_from_hash = Bandwidth::StirShaken.build_from_hash({
        verstat: 'TN-Validation-Passed',
        attestationIndicator: 'A',
        originatingId: '99759086-1335-11ed-9bcf-5f7d464e91af'
      })
      expect(stir_shaken_from_hash).to be_instance_of(Bandwidth::StirShaken)
      expect(stir_shaken_from_hash.verstat).to eq('TN-Validation-Passed')
      expect(stir_shaken_from_hash.attestation_indicator).to eq('A')
      expect(stir_shaken_from_hash.originating_id).to eq('99759086-1335-11ed-9bcf-5f7d464e91af')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(stir_shaken_values.to_s).to eq('{:verstat=>"TN-Validation-Passed", :attestationIndicator=>"A", :originatingId=>"99759086-1335-11ed-9bcf-5f7d464e91af"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(stir_shaken_default.eql?(Bandwidth::StirShaken.new)).to be true
      expect(stir_shaken_default.eql?(stir_shaken_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(stir_shaken_values.to_body).to eq({
        verstat: 'TN-Validation-Passed',
        attestationIndicator: 'A',
        originatingId: '99759086-1335-11ed-9bcf-5f7d464e91af'
      })
    end
  end
end
