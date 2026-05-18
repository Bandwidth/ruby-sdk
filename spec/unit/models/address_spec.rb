# Unit tests for Bandwidth::Address
describe Bandwidth::Address do
  let(:address_default) { Bandwidth::Address.new({
    name: 'Bandwidth',
    addr1: '900 Main Campus Dr',
    city: 'Raleigh',
    state: 'NC',
    zip: '27606',
    url: 'https://www.bandwidth.com'
  }) }
  let(:address_values) { Bandwidth::Address.new({
    name: 'Bandwidth',
    addr1: '900 Main Campus Dr',
    addr2: 'Suite 100',
    city: 'Raleigh',
    state: 'NC',
    zip: '27606',
    url: 'https://www.bandwidth.com'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Address.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Address.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Address.acceptable_attributes).to eq(Bandwidth::Address.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::Address.openapi_nullable).to eq(Set.new([:'addr2']))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Address created by the build_from_hash method' do
      address_from_hash = Bandwidth::Address.build_from_hash({
        name: 'Bandwidth',
        addr1: '900 Main Campus Dr',
        addr2: 'Suite 100',
        city: 'Raleigh',
        state: 'NC',
        zip: '27606',
        url: 'https://www.bandwidth.com'
      })
      expect(address_from_hash).to be_instance_of(Bandwidth::Address)
      expect(address_from_hash.name).to eq('Bandwidth')
      expect(address_from_hash.addr1).to eq('900 Main Campus Dr')
      expect(address_from_hash.addr2).to eq('Suite 100')
      expect(address_from_hash.city).to eq('Raleigh')
      expect(address_from_hash.state).to eq('NC')
      expect(address_from_hash.zip).to eq('27606')
      expect(address_from_hash.url).to eq('https://www.bandwidth.com')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(address_values.to_s).to eq('{:name=>"Bandwidth", :addr1=>"900 Main Campus Dr", :addr2=>"Suite 100", :city=>"Raleigh", :state=>"NC", :zip=>"27606", :url=>"https://www.bandwidth.com"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      address_equal = Bandwidth::Address.new({
        name: 'Bandwidth',
        addr1: '900 Main Campus Dr',
        city: 'Raleigh',
        state: 'NC',
        zip: '27606',
        url: 'https://www.bandwidth.com'
      })
      expect(address_default.eql?(address_equal)).to be true
      expect(address_default.eql?(address_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(address_values.to_body).to eq({
        name: 'Bandwidth',
        addr1: '900 Main Campus Dr',
        addr2: 'Suite 100',
        city: 'Raleigh',
        state: 'NC',
        zip: '27606',
        url: 'https://www.bandwidth.com'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#name=' do
      expect {
        Bandwidth::Address.new({ name: nil })
      }.to raise_error(ArgumentError, 'name cannot be nil')

      expect {
        Bandwidth::Address.new({ name: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Address.new({ name: '' })
      }.to raise_error(ArgumentError, 'invalid value for "name", the character length must be greater than or equal to 1.')
    end

    it '#addr1=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: nil })
      }.to raise_error(ArgumentError, 'addr1 cannot be nil')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "addr1", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '' })
      }.to raise_error(ArgumentError, 'invalid value for "addr1", the character length must be greater than or equal to 1.')
    end

    it '#addr2=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', addr2: 'a' * 501, city: 'Raleigh', state: 'NC', zip: '27606', url: 'https://www.bandwidth.com' })
      }.to raise_error(ArgumentError, 'invalid value for "addr2", the character length must be smaller than or equal to 500.')
    end

    it '#city=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: nil })
      }.to raise_error(ArgumentError, 'city cannot be nil')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "city", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: '' })
      }.to raise_error(ArgumentError, 'invalid value for "city", the character length must be greater than or equal to 1.')
    end

    it '#state=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: nil })
      }.to raise_error(ArgumentError, 'state cannot be nil')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "state", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: '' })
      }.to raise_error(ArgumentError, 'invalid value for "state", the character length must be greater than or equal to 1.')
    end

    it '#zip=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: nil })
      }.to raise_error(ArgumentError, 'zip cannot be nil')
    end

    it '#url=' do
      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: nil })
      }.to raise_error(ArgumentError, 'url cannot be nil')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "url", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Address.new({ name: 'Bandwidth', addr1: '900 Main Campus Dr', city: 'Raleigh', state: 'NC', zip: '27606', url: '' })
      }.to raise_error(ArgumentError, 'invalid value for "url", the character length must be greater than or equal to 1.')
    end
  end
end
