# Unit tests for Bandwidth::BridgeTargetCompleteCallback
describe Bandwidth::BridgeTargetCompleteCallback do
  let(:bridge_target_complete_callback_default) { Bandwidth::BridgeTargetCompleteCallback.new }
  let(:bridge_target_complete_callback_values) { Bandwidth::BridgeTargetCompleteCallback.new({
    event_type: 'answer',
    event_time: '2023-06-19T10:00:00Z',
    account_id: '123456',
    application_id: '789012',
    from: '+15555555555',
    to: '+16666666666',
    direction: 'outbound',
    call_id: '987654321',
    call_url: 'https://example.com/calls/987654321',
    enqueued_time: '2023-06-19T09:59:00Z',
    start_time: '2023-06-19T10:00:00Z',
    answer_time: '2023-06-19T10:00:05Z',
    tag: 'important'
  }) }

  describe '#initialize' do
    it 'validates instance of BridgeTargetCompleteCallback initialized with attributes passed in' do
      expect(bridge_target_complete_callback_values).to be_instance_of(Bandwidth::BridgeTargetCompleteCallback)
      expect(bridge_target_complete_callback_values.event_type).to eq('answer')
      expect(bridge_target_complete_callback_values.event_time).to eq('2023-06-19T10:00:00Z')
      expect(bridge_target_complete_callback_values.account_id).to eq('123456')
      expect(bridge_target_complete_callback_values.application_id).to eq('789012')
      expect(bridge_target_complete_callback_values.from).to eq('+15555555555')
      expect(bridge_target_complete_callback_values.to).to eq('+16666666666')
      expect(bridge_target_complete_callback_values.direction).to eq('outbound')
      expect(bridge_target_complete_callback_values.call_id).to eq('987654321')
      expect(bridge_target_complete_callback_values.call_url).to eq('https://example.com/calls/987654321')
      expect(bridge_target_complete_callback_values.enqueued_time).to eq('2023-06-19T09:59:00Z')
      expect(bridge_target_complete_callback_values.start_time).to eq('2023-06-19T10:00:00Z')
      expect(bridge_target_complete_callback_values.answer_time).to eq('2023-06-19T10:00:05Z')
      expect(bridge_target_complete_callback_values.tag).to eq('important')
    end

    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BridgeTargetCompleteCallback.new([])
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BridgeTargetCompleteCallback.new({ invalid: true })
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  describe 'EnumAttributeValidator' do
    it 'validates string enum' do
      validator = Bandwidth::BridgeTargetCompleteCallback::EnumAttributeValidator.new(String, ['valid'])
      expect(validator.valid?('valid')).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates integer enum' do
      validator = Bandwidth::BridgeTargetCompleteCallback::EnumAttributeValidator.new(Integer, [1])
      expect(validator.valid?(1)).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates float enum' do
      validator = Bandwidth::BridgeTargetCompleteCallback::EnumAttributeValidator.new(Float, [1.0])
      expect(validator.valid?(1.0)).to be true
      expect(validator.valid?('invalid')).to be false
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BridgeTargetCompleteCallback created by the build_from_hash method' do
      bridge_target_complete_callback_from_hash = Bandwidth::BridgeTargetCompleteCallback.build_from_hash({
        eventType: 'answer',
        eventTime: '2023-06-19T10:00:00Z',
        accountId: '123456',
        applicationId: '789012',
        from: '+15555555555',
        to: '+16666666666',
        direction: 'outbound',
        callId: '987654321',
        callUrl: 'https://example.com/calls/987654321',
        enqueuedTime: '2023-06-19T09:59:00Z',
        startTime: '2023-06-19T10:00:00Z',
        answerTime: '2023-06-19T10:00:05Z',
        tag: nil
      })
      expect(bridge_target_complete_callback_from_hash).to be_instance_of(Bandwidth::BridgeTargetCompleteCallback)
      expect(bridge_target_complete_callback_from_hash.event_type).to eq('answer')
      expect(bridge_target_complete_callback_from_hash.event_time).to eq(Time.parse('2023-06-19T10:00:00Z'))
      expect(bridge_target_complete_callback_from_hash.account_id).to eq('123456')
      expect(bridge_target_complete_callback_from_hash.application_id).to eq('789012')
      expect(bridge_target_complete_callback_from_hash.from).to eq('+15555555555')
      expect(bridge_target_complete_callback_from_hash.to).to eq('+16666666666')
      expect(bridge_target_complete_callback_from_hash.direction).to eq('outbound')
      expect(bridge_target_complete_callback_from_hash.call_id).to eq('987654321')
      expect(bridge_target_complete_callback_from_hash.call_url).to eq('https://example.com/calls/987654321')
      expect(bridge_target_complete_callback_from_hash.enqueued_time).to eq(Time.parse('2023-06-19T09:59:00Z'))
      expect(bridge_target_complete_callback_from_hash.start_time).to eq(Time.parse('2023-06-19T10:00:00Z'))
      expect(bridge_target_complete_callback_from_hash.answer_time).to eq(Time.parse('2023-06-19T10:00:05Z'))
      expect(bridge_target_complete_callback_from_hash.tag).to be nil
    end
  end

  describe '#list_invalid_properties' do
    it 'returns list of invalid properties' do
      expect(bridge_target_complete_callback_default.list_invalid_properties).to eq([])
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(bridge_target_complete_callback_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(bridge_target_complete_callback_default.to_s).to eq('{}')
    end
  end

  describe '#valid?' do
    it 'validates instances with and without attributes set' do
      expect(bridge_target_complete_callback_default).to be_valid
      expect(bridge_target_complete_callback_values).to be_valid
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(bridge_target_complete_callback_default.eql?(Bandwidth::BridgeTargetCompleteCallback.new)).to be true
      expect(bridge_target_complete_callback_default.eql?(bridge_target_complete_callback_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(bridge_target_complete_callback_values.to_body).to eq({
        eventType: 'answer',
        eventTime: '2023-06-19T10:00:00Z',
        accountId: '123456',
        applicationId: '789012',
        from: '+15555555555',
        to: '+16666666666',
        direction: 'outbound',
        callId: '987654321',
        callUrl: 'https://example.com/calls/987654321',
        enqueuedTime: '2023-06-19T09:59:00Z',
        startTime: '2023-06-19T10:00:00Z',
        answerTime: '2023-06-19T10:00:05Z',
        tag: 'important'
      })
    end
  end
end
