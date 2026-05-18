# Unit tests for Bandwidth::Contact
describe Bandwidth::Contact do
  let(:contact_default) { Bandwidth::Contact.new({
    first_name: 'Baseline',
    last_name: 'User',
    email: 'baseline@example.com',
    phone_number: '+19195550100'
  }) }
  let(:contact_values) { Bandwidth::Contact.new({
    first_name: 'John',
    last_name: 'Doe',
    email: 'john.doe@example.com',
    phone_number: '+19195551234'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Contact.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Contact.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Contact.acceptable_attributes).to eq(Bandwidth::Contact.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Contact.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Contact created by the build_from_hash method' do
      contact_from_hash = Bandwidth::Contact.build_from_hash({
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        phoneNumber: '+19195551234'
      })
      expect(contact_from_hash).to be_instance_of(Bandwidth::Contact)
      expect(contact_from_hash.first_name).to eq('John')
      expect(contact_from_hash.last_name).to eq('Doe')
      expect(contact_from_hash.email).to eq('john.doe@example.com')
      expect(contact_from_hash.phone_number).to eq('+19195551234')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(contact_values.to_s).to eq('{:firstName=>"John", :lastName=>"Doe", :email=>"john.doe@example.com", :phoneNumber=>"+19195551234"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      contact_equal = Bandwidth::Contact.new({
        first_name: 'Baseline',
        last_name: 'User',
        email: 'baseline@example.com',
        phone_number: '+19195550100'
      })
      expect(contact_default.eql?(contact_equal)).to be true
      expect(contact_default.eql?(contact_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(contact_values.to_body).to eq({
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@example.com',
        phoneNumber: '+19195551234'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#first_name=' do
      expect {
        Bandwidth::Contact.new({ first_name: nil, last_name: 'Doe', email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'first_name cannot be nil')

      expect {
        Bandwidth::Contact.new({ first_name: 'a' * 501, last_name: 'Doe', email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "first_name", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Contact.new({ first_name: '', last_name: 'Doe', email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "first_name", the character length must be greater than or equal to 1.')
    end

    it '#last_name=' do
      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: nil, email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'last_name cannot be nil')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'a' * 501, email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "last_name", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: '', email: 'a@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "last_name", the character length must be greater than or equal to 1.')
    end

    it '#email=' do
      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: nil, phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'email cannot be nil')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: ('a' * 495) + '@b.com', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, 'invalid value for "email", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: 'not-an-email', phone_number: '+19195551234' })
      }.to raise_error(ArgumentError, /invalid value for "email", must conform to the pattern/)
    end

    it '#phone_number=' do
      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: 'a@b.com', phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: 'a@b.com', phone_number: 'a' * 501 })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be smaller than or equal to 500.')

      expect {
        Bandwidth::Contact.new({ first_name: 'John', last_name: 'Doe', email: 'a@b.com', phone_number: '' })
      }.to raise_error(ArgumentError, 'invalid value for "phone_number", the character length must be greater than or equal to 1.')
    end
  end
end
