# Unit tests for Bandwidth::CallState
describe Bandwidth::CallState do
  let(:call_state_default) { Bandwidth::CallState.new }
  let(:call_state_values) { Bandwidth::CallState.new({
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    account_id: '9900000',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    parent_call_id: 'c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    to: '+19195551234',
    from: '+19195554321',
    direction: 'inbound',
    state: 'disconnected',
    stir_shaken: {
      'verstat': 'TN-Verification-Passed',
      'attestationIndicator': 'A',
      'originatingId': 'abc123'
    },
    identity: 'eyJhbGciOiJFUzI1NiI',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    start_time: '2022-06-16T13:15:07.160Z',
    answer_time: '2022-06-16T13:15:18.126Z',
    end_time: '2022-06-16T13:15:18.314Z',
    disconnect_cause: 'hangup',
    error_message: nil,
    error_id: nil,
    last_update: '2022-06-16T13:15:18.314Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CallState.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CallState.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CallState.acceptable_attributes).to eq(Bandwidth::CallState.attribute_map.values)
    end
  end

  describe 'EnumAttributeValidator' do
    it 'validates string enum' do
      validator = Bandwidth::CallState::EnumAttributeValidator.new(String, ['valid'])
      expect(validator.valid?('valid')).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates integer enum' do
      validator = Bandwidth::CallState::EnumAttributeValidator.new(Integer, [1])
      expect(validator.valid?(1)).to be true
      expect(validator.valid?('invalid')).to be false
    end

    it 'validates float enum' do
      validator = Bandwidth::CallState::EnumAttributeValidator.new(Float, [1.0])
      expect(validator.valid?(1.0)).to be true
      expect(validator.valid?('invalid')).to be false
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CallState created by the build_from_hash method' do
      call_state_from_hash = Bandwidth::CallState.build_from_hash({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        to: '+19195551234',
        from: '+19195554321',
        direction: 'inbound',
        state: 'disconnected',
        stirShaken: {
          'verstat': 'TN-Verification-Passed',
          'attestationIndicator': 'A',
          'originatingId': 'abc123'
        },
        identity: 'eyJhbGciOiJFUzI1NiI',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        endTime: '2022-06-16T13:15:18.314Z',
        disconnectCause: 'hangup',
        errorMessage: nil,
        errorId: nil,
        lastUpdate: '2022-06-16T13:15:18.314Z'
      })
      expect(call_state_from_hash).to be_instance_of(Bandwidth::CallState)
      expect(call_state_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(call_state_from_hash.account_id).to eq('9900000')
      expect(call_state_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_state_from_hash.parent_call_id).to eq('c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(call_state_from_hash.to).to eq('+19195551234')
      expect(call_state_from_hash.from).to eq('+19195554321')
      expect(call_state_from_hash.direction).to eq('inbound')
      expect(call_state_from_hash.state).to eq('disconnected')
      expect(call_state_from_hash.stir_shaken).to eq({
        'verstat' => 'TN-Verification-Passed',
        'attestationIndicator' => 'A',
        'originatingId' => 'abc123'
      })
      expect(call_state_from_hash.identity).to eq('eyJhbGciOiJFUzI1NiI')
      expect(call_state_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(call_state_from_hash.start_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(call_state_from_hash.answer_time).to eq(Time.parse('2022-06-16T13:15:18.126Z'))
      expect(call_state_from_hash.end_time).to eq(Time.parse('2022-06-16T13:15:18.314Z'))
      expect(call_state_from_hash.disconnect_cause).to eq('hangup')
      expect(call_state_from_hash.error_message).to eq(nil)
      expect(call_state_from_hash.error_id).to eq(nil)
      expect(call_state_from_hash.last_update).to eq(Time.parse('2022-06-16T13:15:18.314Z'))
    end
  end

  describe '#list_invalid_properties' do
    it 'returns list of invalid properties' do
      expect(call_state_default.list_invalid_properties).to eq([])
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(call_state_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(call_state_default.to_s).to eq('{}')
    end
  end

  describe '#valid?' do
    it 'validates instances with and without attributes set' do
      expect(call_state_default).to be_valid
      expect(call_state_values).to be_valid
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(call_state_default.eql?(Bandwidth::CallState.new)).to be true
      expect(call_state_default.eql?(call_state_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(call_state_values.to_body).to eq({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        parentCallId: 'c-25ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        to: '+19195551234',
        from: '+19195554321',
        direction: 'inbound',
        state: 'disconnected',
        stirShaken: {
          'verstat': 'TN-Verification-Passed',
          'attestationIndicator': 'A',
          'originatingId': 'abc123'
        },
        identity: 'eyJhbGciOiJFUzI1NiI',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        startTime: '2022-06-16T13:15:07.160Z',
        answerTime: '2022-06-16T13:15:18.126Z',
        endTime: '2022-06-16T13:15:18.314Z',
        disconnectCause: 'hangup',
        errorMessage: nil,
        errorId: nil,
        lastUpdate: '2022-06-16T13:15:18.314Z'
      })
    end
  end
end
