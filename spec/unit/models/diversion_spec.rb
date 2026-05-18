# Unit tests for Bandwidth::Diversion
describe Bandwidth::Diversion do
  let(:diversion_default) { Bandwidth::Diversion.new }
  let(:diversion_values) { Bandwidth::Diversion.new({
    reason: 'unconditional',
    privacy: 'off',
    screen: 'no',
    counter: '2',
    limit: '5',
    unknown: 'some-value',
    orig_to: '+19195551234'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Diversion.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Diversion.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Diversion.acceptable_attributes).to eq(Bandwidth::Diversion.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Diversion.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Diversion created by the build_from_hash method' do
      diversion_from_hash = Bandwidth::Diversion.build_from_hash({
        reason: 'unconditional',
        privacy: 'off',
        screen: 'no',
        counter: '2',
        limit: '5',
        unknown: 'some-value',
        origTo: '+19195551234'
      })
      expect(diversion_from_hash).to be_instance_of(Bandwidth::Diversion)
      expect(diversion_from_hash.reason).to eq('unconditional')
      expect(diversion_from_hash.privacy).to eq('off')
      expect(diversion_from_hash.screen).to eq('no')
      expect(diversion_from_hash.counter).to eq('2')
      expect(diversion_from_hash.limit).to eq('5')
      expect(diversion_from_hash.unknown).to eq('some-value')
      expect(diversion_from_hash.orig_to).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(diversion_values.to_s).to eq('{:reason=>"unconditional", :privacy=>"off", :screen=>"no", :counter=>"2", :limit=>"5", :unknown=>"some-value", :origTo=>"+19195551234"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(diversion_default.eql?(Bandwidth::Diversion.new)).to be true
      expect(diversion_default.eql?(diversion_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(diversion_values.to_body).to eq({
        reason: 'unconditional',
        privacy: 'off',
        screen: 'no',
        counter: '2',
        limit: '5',
        unknown: 'some-value',
        origTo: '+19195551234'
      })
    end
  end
end
