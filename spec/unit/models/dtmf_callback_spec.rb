# Unit tests for Bandwidth::DtmfCallback
describe Bandwidth::DtmfCallback do
  let(:dtmf_callback_default) { Bandwidth::DtmfCallback.new }
  let(:dtmf_callback_values) { Bandwidth::DtmfCallback.new({
    event_type: 'dtmf',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    digit: '1',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    parent_call_id: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
    transfer_caller_id: '+19195554321',
    transfer_to: '+19195551234',
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::DtmfCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::DtmfCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::DtmfCallback.acceptable_attributes).to eq(Bandwidth::DtmfCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::DtmfCallback.openapi_nullable).to eq(Set.new([
        :'enqueued_time',
        :'answer_time',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of DtmfCallback created by the build_from_hash method' do
      dtmf_callback_from_hash = Bandwidth::DtmfCallback.build_from_hash({
        eventType: 'dtmf',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        digit: '1',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        transferCallerId: '+19195554321',
        transferTo: '+19195551234',
        tag: 'custom tag'
      })
      expect(dtmf_callback_from_hash).to be_instance_of(Bandwidth::DtmfCallback)
      expect(dtmf_callback_from_hash.event_type).to eq('dtmf')
      expect(dtmf_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(dtmf_callback_from_hash.account_id).to eq('9900000')
      expect(dtmf_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(dtmf_callback_from_hash.from).to eq('+19195554321')
      expect(dtmf_callback_from_hash.to).to eq('+19195551234')
      expect(dtmf_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(dtmf_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(dtmf_callback_from_hash.digit).to eq('1')
      expect(dtmf_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(dtmf_callback_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(dtmf_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(dtmf_callback_from_hash.answer_time).to eq(Time.parse('2022-06-16T13:15:18.126Z'))
      expect(dtmf_callback_from_hash.parent_call_id).to eq('c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99')
      expect(dtmf_callback_from_hash.transfer_caller_id).to eq('+19195554321')
      expect(dtmf_callback_from_hash.transfer_to).to eq('+19195551234')
      expect(dtmf_callback_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(dtmf_callback_values.to_s).to eq('{:eventType=>"dtmf", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :direction=>"inbound", :digit=>"1", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :enqueuedTime=>"2022-06-16T13:15:07.160Z", :startTime=>"2022-06-16T13:15:07.160Z", :answerTime=>"2022-06-16T13:15:18.126Z", :parentCallId=>"c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99", :transferCallerId=>"+19195554321", :transferTo=>"+19195551234", :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(dtmf_callback_default.eql?(Bandwidth::DtmfCallback.new)).to be true
      expect(dtmf_callback_default.eql?(dtmf_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(dtmf_callback_values.to_body).to eq({
        eventType: 'dtmf',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        digit: '1',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        parentCallId: 'c-95ac29a2-1331029c-2cb0-4a07-b215-b22865662d99',
        transferCallerId: '+19195554321',
        transferTo: '+19195551234',
        tag: 'custom tag'
      })
    end
  end
end
