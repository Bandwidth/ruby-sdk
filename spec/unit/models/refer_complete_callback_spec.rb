Original file line number	Diff line number	Diff line change
# Unit tests for Bandwidth::ReferCompleteCallback
describe Bandwidth::ReferCompleteCallback do
  let(:refer_complete_callback_default) { Bandwidth::ReferCompleteCallback.new }
  let(:refer_complete_callback_success) { Bandwidth::ReferCompleteCallback.new({
    event_type: 'referComplete',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    tag: 'custom tag',
    refer_to: 'sip:alice@atlanta.example.com',
    refer_call_status: Bandwidth::ReferCallStatusEnum::SUCCESS
  }) }
  let(:refer_complete_callback_failure) { Bandwidth::ReferCompleteCallback.new({
    event_type: 'referComplete',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    tag: 'custom tag',
    refer_to: 'sip:alice@atlanta.example.com',
    refer_call_status: Bandwidth::ReferCallStatusEnum::FAILURE,
    refer_sip_response_code: 405
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
        :'enqueued_time',
        :'answer_time',
        :'tag',
        :'refer_sip_response_code',
        :'notify_sip_response_code'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ReferCompleteCallback created by the build_from_hash method (success)' do
      callback = Bandwidth::ReferCompleteCallback.build_from_hash({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        referTo: 'sip:alice@atlanta.example.com',
        referCallStatus: 'success',
        referSipResponseCode: nil,
        notifySipResponseCode: nil
      })
      expect(callback).to be_instance_of(Bandwidth::ReferCompleteCallback)
      expect(callback.event_type).to eq('referComplete')
      expect(callback.account_id).to eq('9900000')
      expect(callback.refer_to).to eq('sip:alice@atlanta.example.com')
      expect(callback.refer_call_status).to eq(Bandwidth::ReferCallStatusEnum::SUCCESS)
      expect(callback.refer_sip_response_code).to be_nil
      expect(callback.notify_sip_response_code).to be_nil
    end

    it 'validates instance of ReferCompleteCallback for a rejected REFER (referSipResponseCode=405)' do
      callback = Bandwidth::ReferCompleteCallback.build_from_hash({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: 'inbound',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        referTo: 'sip:alice@atlanta.example.com',
        referCallStatus: 'failure',
        referSipResponseCode: 405
      })
      expect(callback).to be_instance_of(Bandwidth::ReferCompleteCallback)
      expect(callback.refer_call_status).to eq(Bandwidth::ReferCallStatusEnum::FAILURE)
      expect(callback.refer_sip_response_code).to eq(405)
      expect(callback.notify_sip_response_code).to be_nil
    end

    it 'validates instance of ReferCompleteCallback for an unreachable destination (notifySipResponseCode present)' do
      callback = Bandwidth::ReferCompleteCallback.build_from_hash({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: 'inbound',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        referTo: 'sip:alice@atlanta.example.com',
        referCallStatus: 'failure',
        referSipResponseCode: 202,
        notifySipResponseCode: 503
      })
      expect(callback).to be_instance_of(Bandwidth::ReferCompleteCallback)
      expect(callback.refer_call_status).to eq(Bandwidth::ReferCallStatusEnum::FAILURE)
      expect(callback.refer_sip_response_code).to eq(202)
      expect(callback.notify_sip_response_code).to eq(503)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(refer_complete_callback_success.to_s).to eq('{:eventType=>"referComplete", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :direction=>"inbound", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :startTime=>"2022-06-16T13:15:07.160Z", :answerTime=>"2022-06-16T13:15:18.126Z", :tag=>"custom tag", :referTo=>"sip:alice@atlanta.example.com", :referCallStatus=>"success"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(refer_complete_callback_default.eql?(Bandwidth::ReferCompleteCallback.new)).to be true
      expect(refer_complete_callback_default.eql?(refer_complete_callback_success)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the success callback' do
      expect(refer_complete_callback_success.to_body).to eq({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        referTo: 'sip:alice@atlanta.example.com',
        referCallStatus: Bandwidth::ReferCallStatusEnum::SUCCESS
      })
    end

    it 'returns a hash representation of the failure callback with referSipResponseCode' do
      expect(refer_complete_callback_failure.to_body).to eq({
        eventType: 'referComplete',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        referTo: 'sip:alice@atlanta.example.com',
        referCallStatus: Bandwidth::ReferCallStatusEnum::FAILURE,
        referSipResponseCode: 405
      })
    end
  end
end