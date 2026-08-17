# Unit tests for Bandwidth::ReferCompleteCallback
describe Bandwidth::ReferCompleteCallback do
  let(:refer_complete_callback_default) { Bandwidth::ReferCompleteCallback.new }
  let(:refer_complete_callback_values) { Bandwidth::ReferCompleteCallback.new({
    event_type: 'referComplete',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::OUTBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    tag: 'custom tag',
    refer_call_status: Bandwidth::ReferCallStatusEnum::SUCCESS,
    refer_sip_response_code: 202,
    notify_sip_response_code: 200
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ReferCompleteCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ReferCompleteCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ReferCompleteCallback.acceptable_attributes).to eq(Bandwidth::ReferCompleteCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ReferCompleteCallback.openapi_nullable).to eq(Set.new([
        :'answer_time',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ReferCompleteCallback created by the build_from_hash method' do
      refer_complete_callback_from_hash = Bandwidth::ReferCompleteCallback.build_from_hash({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::OUTBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        referCallStatus: Bandwidth::ReferCallStatusEnum::SUCCESS,
        referSipResponseCode: 202,
        notifySipResponseCode: 200
      })
      expect(refer_complete_callback_from_hash).to be_instance_of(Bandwidth::ReferCompleteCallback)
      expect(refer_complete_callback_from_hash.event_type).to eq('referComplete')
      expect(refer_complete_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(refer_complete_callback_from_hash.account_id).to eq('9900000')
      expect(refer_complete_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(refer_complete_callback_from_hash.from).to eq('+19195554321')
      expect(refer_complete_callback_from_hash.to).to eq('+19195551234')
      expect(refer_complete_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::OUTBOUND)
      expect(refer_complete_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(refer_complete_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(refer_complete_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(refer_complete_callback_from_hash.answer_time).to eq(Time.parse('2022-06-16T13:15:18.126Z'))
      expect(refer_complete_callback_from_hash.tag).to eq('custom tag')
      expect(refer_complete_callback_from_hash.refer_call_status).to eq(Bandwidth::ReferCallStatusEnum::SUCCESS)
      expect(refer_complete_callback_from_hash.refer_sip_response_code).to eq(202)
      expect(refer_complete_callback_from_hash.notify_sip_response_code).to eq(200)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(refer_complete_callback_values.to_s).to eq({ :eventType => 'referComplete', :eventTime => '2022-06-16T13:15:07.160Z', :accountId => '9900000', :applicationId => '04e88489-df02-4e34-a0ee-27a91849555f', :from => '+19195554321', :to => '+19195551234', :direction => 'outbound', :callId => 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85', :callUrl => 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85', :startTime => '2022-06-16T13:15:07.160Z', :answerTime => '2022-06-16T13:15:18.126Z', :tag => 'custom tag', :referCallStatus => 'success', :referSipResponseCode => 202, :notifySipResponseCode => 200 }.to_s)
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(refer_complete_callback_default.eql?(Bandwidth::ReferCompleteCallback.new)).to be true
      expect(refer_complete_callback_default.eql?(refer_complete_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(refer_complete_callback_values.to_body).to eq({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::OUTBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        referCallStatus: Bandwidth::ReferCallStatusEnum::SUCCESS,
        referSipResponseCode: 202,
        notifySipResponseCode: 200
      })
    end
  end
end
