# Unit tests for Bandwidth::AnswerCallback
describe Bandwidth::AnswerCallback do
  let(:answer_callback_default) { Bandwidth::AnswerCallback.new }
  let(:answer_callback_values) { Bandwidth::AnswerCallback.new({
    event_type: 'answer',
    event_time: '2022-06-16T13:15:07.160Z',
    account_id: '9900000',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    from: '+19195554321',
    to: '+19195551234',
    direction: Bandwidth::CallDirectionEnum::INBOUND,
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    tag: 'custom tag',
    machine_detection_result: { value: 'human', duration: 'PT5S' },
    sip_call_id: 'sip-call-id-12345',
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::AnswerCallback.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::AnswerCallback.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::AnswerCallback.acceptable_attributes).to eq(Bandwidth::AnswerCallback.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::AnswerCallback.openapi_nullable).to eq(Set.new([
        :'enqueued_time',
        :'answer_time',
        :'tag',
        :'machine_detection_result'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of AnswerCallback created by the build_from_hash method' do
      answer_callback_from_hash = Bandwidth::AnswerCallback.build_from_hash({
        eventType: 'answer',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        machineDetectionResult: { value: 'human', duration: 'PT5S' },
        sipCallId: 'sip-call-id-12345'
      })
      expect(answer_callback_from_hash).to be_instance_of(Bandwidth::AnswerCallback)
      expect(answer_callback_from_hash.event_type).to eq('answer')
      expect(answer_callback_from_hash.event_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(answer_callback_from_hash.account_id).to eq('9900000')
      expect(answer_callback_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(answer_callback_from_hash.from).to eq('+19195554321')
      expect(answer_callback_from_hash.to).to eq('+19195551234')
      expect(answer_callback_from_hash.direction).to eq(Bandwidth::CallDirectionEnum::INBOUND)
      expect(answer_callback_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(answer_callback_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(answer_callback_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(answer_callback_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(answer_callback_from_hash.answer_time).to eq(Time.parse('2022-06-16T13:15:18.126Z'))
      expect(answer_callback_from_hash.tag).to eq('custom tag')
      expect(answer_callback_from_hash.machine_detection_result).to be_instance_of(Bandwidth::MachineDetectionResult)
      expect(answer_callback_from_hash.machine_detection_result.value).to eq('human')
      expect(answer_callback_from_hash.machine_detection_result.duration).to eq('PT5S')
      expect(answer_callback_from_hash.sip_call_id).to eq('sip-call-id-12345')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(answer_callback_values.to_s).to eq('{:eventType=>"answer", :eventTime=>"2022-06-16T13:15:07.160Z", :accountId=>"9900000", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :from=>"+19195554321", :to=>"+19195551234", :direction=>"inbound", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :enqueuedTime=>"2022-06-16T13:15:07.160Z", :startTime=>"2022-06-16T13:15:07.160Z", :answerTime=>"2022-06-16T13:15:18.126Z", :tag=>"custom tag", :machineDetectionResult=>{:value=>"human", :duration=>"PT5S"}, :sipCallId=>"sip-call-id-12345"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(answer_callback_default.eql?(Bandwidth::AnswerCallback.new)).to be true
      expect(answer_callback_default.eql?(answer_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(answer_callback_values.to_body).to eq({
        eventType: 'answer',
        eventTime: '2022-06-16T13:15:07.160Z',
        accountId: '9900000',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        from: '+19195554321',
        to: '+19195551234',
        direction: Bandwidth::CallDirectionEnum::INBOUND,
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        tag: 'custom tag',
        machineDetectionResult: { value: 'human', duration: 'PT5S' },
        sipCallId: 'sip-call-id-12345'
      })
    end
  end
end
