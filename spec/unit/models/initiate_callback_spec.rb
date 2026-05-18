# Unit tests for Bandwidth::InitiateCallback
describe Bandwidth::InitiateCallback do
  let(:initiate_callback_default) { Bandwidth::InitiateCallback.new }
  let(:initiate_callback_values) { Bandwidth::InitiateCallback.new({
    event_type: 'initiate',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    start_time: '2022-06-16T13:15:07.160Z',
    diversion: { reason: 'unconditional', privacy: 'off' },
    stir_shaken: { verstat: 'TN-Validation-Passed', attestationIndicator: 'A', originatingId: '527c7d1f-22a4-4ec1-ad19-1a4ec9466cdb' },
    uui: 'aGVsbG8sIHdvcmxkIQ==;encoding=base64'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::InitiateCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::InitiateCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::InitiateCallback.acceptable_attributes).to eq(Bandwidth::InitiateCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::InitiateCallback.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of InitiateCallback created by the build_from_hash method' do
      initiate_callback_from_hash = Bandwidth::InitiateCallback.build_from_hash({
        eventType: 'initiate',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        diversion: { reason: 'unconditional', privacy: 'off' },
        stirShaken: { verstat: 'TN-Validation-Passed', attestationIndicator: 'A', originatingId: '527c7d1f-22a4-4ec1-ad19-1a4ec9466cdb' },
        uui: 'aGVsbG8sIHdvcmxkIQ==;encoding=base64'
      })
      expect(initiate_callback_from_hash).to be_instance_of(Bandwidth::InitiateCallback)
      expect(initiate_callback_from_hash.event_type).to eq('initiate')
      expect(initiate_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(initiate_callback_from_hash.account_id).to eq('9900000')
      expect(initiate_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(initiate_callback_from_hash.from).to eq('+19195554321')
      expect(initiate_callback_from_hash.to).to eq('+19195551234')
      expect(initiate_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(initiate_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(initiate_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(initiate_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(initiate_callback_from_hash.diversion).to be_instance_of(Bandwidth::Diversion)
      expect(initiate_callback_from_hash.diversion.reason).to eq('unconditional')
      expect(initiate_callback_from_hash.stir_shaken).to be_instance_of(Bandwidth::StirShaken)
      expect(initiate_callback_from_hash.stir_shaken.verstat).to eq('TN-Validation-Passed')
      expect(initiate_callback_from_hash.uui).to eq('aGVsbG8sIHdvcmxkIQ==;encoding=base64')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(initiate_callback_values.to_s).to eq('{:eventType=>"initiate", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :direction=>"inbound", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :startTime=>"2022-06-16T13:15:07.160Z", :diversion=>{:reason=>"unconditional", :privacy=>"off"}, :stirShaken=>{:verstat=>"TN-Validation-Passed", :attestationIndicator=>"A", :originatingId=>"527c7d1f-22a4-4ec1-ad19-1a4ec9466cdb"}, :uui=>"aGVsbG8sIHdvcmxkIQ==;encoding=base64"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(initiate_callback_default.eql?(Bandwidth::InitiateCallback.new)).to be true
      expect(initiate_callback_default.eql?(initiate_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(initiate_callback_values.to_body).to eq({
        eventType: 'initiate',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        diversion: { reason: 'unconditional', privacy: 'off' },
        stirShaken: { verstat: 'TN-Validation-Passed', attestationIndicator: 'A', originatingId: '527c7d1f-22a4-4ec1-ad19-1a4ec9466cdb' },
        uui: 'aGVsbG8sIHdvcmxkIQ==;encoding=base64'
      })
    end
  end
end
