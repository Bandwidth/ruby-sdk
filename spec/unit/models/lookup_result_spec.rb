# Unit tests for Bandwidth::LookupResult
describe Bandwidth::LookupResult do
  let(:lookup_result_default) { Bandwidth::LookupResult.new }
  let(:lookup_result_values) { Bandwidth::LookupResult.new({
    phone_number: '+19195551234',
    line_type: Bandwidth::LineTypeEnum::MOBILE,
    messaging_provider: 'Bandwidth',
    voice_provider: 'Bandwidth',
    country_code_a3: 'USA',
    deactivation_reporter: 'verizon',
    deactivation_date: '2024-01-01',
    deactivation_event: Bandwidth::DeactivationEventEnum::DEACTIVATED,
    latest_message_delivery_status: Bandwidth::LatestMessageDeliveryStatusEnum::ACTIVE,
    initial_message_delivery_status_date: '2024-01-01',
    latest_message_delivery_status_date: '2024-01-02',
    rcs_enabled: true
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::LookupResult.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::LookupResult.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::LookupResult.acceptable_attributes).to eq(Bandwidth::LookupResult.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::LookupResult.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of LookupResult created by the build_from_hash method' do
      lookup_result_from_hash = Bandwidth::LookupResult.build_from_hash({
        phoneNumber: '+19195551234',
        lineType: 'MOBILE',
        messagingProvider: 'Bandwidth',
        voiceProvider: 'Bandwidth',
        countryCodeA3: 'USA',
        deactivationReporter: 'verizon',
        deactivationDate: '2024-01-01',
        deactivationEvent: 'DEACTIVATED',
        latestMessageDeliveryStatus: 'ACTIVE',
        initialMessageDeliveryStatusDate: '2024-01-01',
        latestMessageDeliveryStatusDate: '2024-01-02',
        rcsEnabled: true
      })
      expect(lookup_result_from_hash).to be_instance_of(Bandwidth::LookupResult)
      expect(lookup_result_from_hash.phone_number).to eq('+19195551234')
      expect(lookup_result_from_hash.line_type).to eq('MOBILE')
      expect(lookup_result_from_hash.messaging_provider).to eq('Bandwidth')
      expect(lookup_result_from_hash.voice_provider).to eq('Bandwidth')
      expect(lookup_result_from_hash.country_code_a3).to eq('USA')
      expect(lookup_result_from_hash.deactivation_reporter).to eq('verizon')
      expect(lookup_result_from_hash.deactivation_date).to eq('2024-01-01')
      expect(lookup_result_from_hash.deactivation_event).to eq('DEACTIVATED')
      expect(lookup_result_from_hash.latest_message_delivery_status).to eq('ACTIVE')
      expect(lookup_result_from_hash.initial_message_delivery_status_date).to eq(Date.parse('2024-01-01'))
      expect(lookup_result_from_hash.latest_message_delivery_status_date).to eq(Date.parse('2024-01-02'))
      expect(lookup_result_from_hash.rcs_enabled).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(lookup_result_values.to_s).to eq('{:phoneNumber=>"+19195551234", :lineType=>"MOBILE", :messagingProvider=>"Bandwidth", :voiceProvider=>"Bandwidth", :countryCodeA3=>"USA", :deactivationReporter=>"verizon", :deactivationDate=>"2024-01-01", :deactivationEvent=>"DEACTIVATED", :latestMessageDeliveryStatus=>"ACTIVE", :initialMessageDeliveryStatusDate=>"2024-01-01", :latestMessageDeliveryStatusDate=>"2024-01-02", :rcsEnabled=>true}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(lookup_result_default.eql?(Bandwidth::LookupResult.new)).to be true
      expect(lookup_result_default.eql?(lookup_result_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(lookup_result_values.to_body).to eq({
        phoneNumber: '+19195551234',
        lineType: Bandwidth::LineTypeEnum::MOBILE,
        messagingProvider: 'Bandwidth',
        voiceProvider: 'Bandwidth',
        countryCodeA3: 'USA',
        deactivationReporter: 'verizon',
        deactivationDate: '2024-01-01',
        deactivationEvent: Bandwidth::DeactivationEventEnum::DEACTIVATED,
        latestMessageDeliveryStatus: Bandwidth::LatestMessageDeliveryStatusEnum::ACTIVE,
        initialMessageDeliveryStatusDate: '2024-01-01',
        latestMessageDeliveryStatusDate: '2024-01-02',
        rcsEnabled: true
      })
    end
  end
end
