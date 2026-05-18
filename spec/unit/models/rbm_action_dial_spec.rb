# Unit tests for Bandwidth::RbmActionDial
describe Bandwidth::RbmActionDial do
  let(:rbm_action_dial_default) { Bandwidth::RbmActionDial.new({
    type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
    text: 'baseline',
    postback_data: 'baseline_postback',
    phone_number: '+15554443333'
  }) }
  let(:rbm_action_dial_values) { Bandwidth::RbmActionDial.new({
    type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
    text: 'Call us',
    postback_data: 'dial_postback',
    phone_number: '+19195554321'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmActionDial.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmActionDial.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmActionDial.acceptable_attributes).to eq(Bandwidth::RbmActionDial.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmActionDial.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmActionDial created by the build_from_hash method' do
      rbm_action_dial_from_hash = Bandwidth::RbmActionDial.build_from_hash({
        type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
        text: 'Call us',
        postbackData: 'dial_postback',
        phoneNumber: '+19195554321'
      })
      expect(rbm_action_dial_from_hash).to be_instance_of(Bandwidth::RbmActionDial)
      expect(rbm_action_dial_from_hash.type).to eq(Bandwidth::RbmActionTypeEnum::DIAL_PHONE)
      expect(rbm_action_dial_from_hash.text).to eq('Call us')
      expect(rbm_action_dial_from_hash.postback_data).to eq('dial_postback')
      expect(rbm_action_dial_from_hash.phone_number).to eq('+19195554321')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_action_dial_values.to_s).to eq('{:type=>"DIAL_PHONE", :text=>"Call us", :postbackData=>"dial_postback", :phoneNumber=>"+19195554321"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_action_dial_equal = Bandwidth::RbmActionDial.new({
        type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
        text: 'baseline',
        postback_data: 'baseline_postback',
        phone_number: '+15554443333'
      })
      expect(rbm_action_dial_default.eql?(rbm_action_dial_equal)).to be true
      expect(rbm_action_dial_default.eql?(rbm_action_dial_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_action_dial_values.to_body).to eq({
        type: Bandwidth::RbmActionTypeEnum::DIAL_PHONE,
        text: 'Call us',
        postbackData: 'dial_postback',
        phoneNumber: '+19195554321'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::RbmActionDial.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#text=' do
      expect {
        Bandwidth::RbmActionDial.new({ type: 'DIAL_PHONE', text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::RbmActionDial.new({ type: 'DIAL_PHONE', text: 'a' * 26 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 25.')
    end

    it '#postback_data=' do
      expect {
        Bandwidth::RbmActionDial.new({ type: 'DIAL_PHONE', text: 'a', postback_data: nil })
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        Bandwidth::RbmActionDial.new({ type: 'DIAL_PHONE', text: 'a', postback_data: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end

    it '#phone_number=' do
      expect {
        Bandwidth::RbmActionDial.new({ type: 'DIAL_PHONE', text: 'a', postback_data: 'a', phone_number: nil })
      }.to raise_error(ArgumentError, 'phone_number cannot be nil')
    end
  end
end
