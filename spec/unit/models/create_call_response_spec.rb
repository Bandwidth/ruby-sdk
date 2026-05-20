# Unit tests for Bandwidth::CreateCallResponse
describe Bandwidth::CreateCallResponse do
  let(:create_call_response_default) { Bandwidth::CreateCallResponse.new({
    application_id: 'baseline-app',
    account_id: '9900000',
    call_id: 'baseline-call',
    to: '+19195550100',
    from: '+19195550101',
    call_url: 'https://example.com/calls/baseline',
    answer_url: 'https://example.com/answer/baseline'
  }) }
  let(:create_call_response_values) { Bandwidth::CreateCallResponse.new({
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    account_id: '9900000',
    call_id: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
    to: '+19195551234',
    from: '+19195554321',
    enqueued_time: '2022-06-16T13:15:07.160Z',
    call_url: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1',
    call_timeout: 30.0,
    callback_timeout: 15.0,
    tag: 'custom tag',
    answer_method: Bandwidth::CallbackMethodEnum::POST,
    answer_url: 'https://example.com/answer',
    answer_fallback_method: Bandwidth::CallbackMethodEnum::POST,
    answer_fallback_url: 'https://example.com/answer-fallback',
    disconnect_method: Bandwidth::CallbackMethodEnum::POST,
    disconnect_url: 'https://example.com/disconnect',
    username: 'user',
    password: 'pass',
    fallback_username: 'fallback_user',
    fallback_password: 'fallback_pass',
    priority: 5
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateCallResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateCallResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateCallResponse.acceptable_attributes).to eq(Bandwidth::CreateCallResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::CreateCallResponse.openapi_nullable).to eq(Set.new([
        :'enqueued_time',
        :'tag',
        :'answer_method',
        :'answer_fallback_method',
        :'answer_fallback_url',
        :'disconnect_method',
        :'disconnect_url',
        :'username',
        :'password',
        :'fallback_username',
        :'fallback_password',
        :'priority'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateCallResponse created by the build_from_hash method' do
      create_call_response_from_hash = Bandwidth::CreateCallResponse.build_from_hash({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        to: '+19195551234',
        from: '+19195554321',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1',
        callTimeout: 30.0,
        callbackTimeout: 15.0,
        tag: 'custom tag',
        answerMethod: 'POST',
        answerUrl: 'https://example.com/answer',
        answerFallbackMethod: 'POST',
        answerFallbackUrl: 'https://example.com/answer-fallback',
        disconnectMethod: 'POST',
        disconnectUrl: 'https://example.com/disconnect',
        username: 'user',
        password: 'pass',
        fallbackUsername: 'fallback_user',
        fallbackPassword: 'fallback_pass',
        priority: 5
      })
      expect(create_call_response_from_hash).to be_instance_of(Bandwidth::CreateCallResponse)
      expect(create_call_response_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(create_call_response_from_hash.account_id).to eq('9900000')
      expect(create_call_response_from_hash.call_id).to eq('c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85')
      expect(create_call_response_from_hash.to).to eq('+19195551234')
      expect(create_call_response_from_hash.from).to eq('+19195554321')
      expect(create_call_response_from_hash.enqueued_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(create_call_response_from_hash.call_url).to eq('https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1')
      expect(create_call_response_from_hash.call_timeout).to eq(30.0)
      expect(create_call_response_from_hash.callback_timeout).to eq(15.0)
      expect(create_call_response_from_hash.tag).to eq('custom tag')
      expect(create_call_response_from_hash.answer_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_response_from_hash.answer_url).to eq('https://example.com/answer')
      expect(create_call_response_from_hash.answer_fallback_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_response_from_hash.answer_fallback_url).to eq('https://example.com/answer-fallback')
      expect(create_call_response_from_hash.disconnect_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_response_from_hash.disconnect_url).to eq('https://example.com/disconnect')
      expect(create_call_response_from_hash.username).to eq('user')
      expect(create_call_response_from_hash.password).to eq('pass')
      expect(create_call_response_from_hash.fallback_username).to eq('fallback_user')
      expect(create_call_response_from_hash.fallback_password).to eq('fallback_pass')
      expect(create_call_response_from_hash.priority).to eq(5)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_call_response_values.to_s).to eq('{:applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :accountId=>"9900000", :callId=>"c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85", :to=>"+19195551234", :from=>"+19195554321", :enqueuedTime=>"2022-06-16T13:15:07.160Z", :callUrl=>"https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1", :callTimeout=>30.0, :callbackTimeout=>15.0, :tag=>"custom tag", :answerMethod=>"POST", :answerUrl=>"https://example.com/answer", :answerFallbackMethod=>"POST", :answerFallbackUrl=>"https://example.com/answer-fallback", :disconnectMethod=>"POST", :disconnectUrl=>"https://example.com/disconnect", :username=>"user", :password=>"pass", :fallbackUsername=>"fallback_user", :fallbackPassword=>"fallback_pass", :priority=>5}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_call_response_equal = Bandwidth::CreateCallResponse.new({
        application_id: 'baseline-app',
        account_id: '9900000',
        call_id: 'baseline-call',
        to: '+19195550100',
        from: '+19195550101',
        call_url: 'https://example.com/calls/baseline',
        answer_url: 'https://example.com/answer/baseline'
      })
      expect(create_call_response_default.eql?(create_call_response_equal)).to be true
      expect(create_call_response_default.eql?(create_call_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_call_response_values.to_body).to eq({
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        accountId: '9900000',
        callId: 'c-15ac29a2-1331029c-2cb0-4a07-b215-b22865662d85',
        to: '+19195551234',
        from: '+19195554321',
        enqueuedTime: '2022-06-16T13:15:07.160Z',
        callUrl: 'https://voice.bandwidth.com/api/v2/accounts/9900000/calls/c-1',
        callTimeout: 30.0,
        callbackTimeout: 15.0,
        tag: 'custom tag',
        answerMethod: Bandwidth::CallbackMethodEnum::POST,
        answerUrl: 'https://example.com/answer',
        answerFallbackMethod: Bandwidth::CallbackMethodEnum::POST,
        answerFallbackUrl: 'https://example.com/answer-fallback',
        disconnectMethod: Bandwidth::CallbackMethodEnum::POST,
        disconnectUrl: 'https://example.com/disconnect',
        username: 'user',
        password: 'pass',
        fallbackUsername: 'fallback_user',
        fallbackPassword: 'fallback_pass',
        priority: 5
      })
    end
  end

  describe 'custom attribute writers' do
    it '#application_id=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: nil, account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#account_id=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: nil, call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'account_id cannot be nil')
    end

    it '#call_id=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: nil, to: 'a', from: 'a', call_url: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'call_id cannot be nil')
    end

    it '#to=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: nil, from: 'a', call_url: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#from=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: nil, call_url: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#call_url=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: nil, answer_url: 'a' })
      }.to raise_error(ArgumentError, 'call_url cannot be nil')
    end

    it '#answer_url=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: nil })
      }.to raise_error(ArgumentError, 'answer_url cannot be nil')
    end

    it '#username=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a', username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.')
    end

    it '#password=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a', password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_username=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a', fallback_username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_password=' do
      expect {
        Bandwidth::CreateCallResponse.new({ application_id: 'a', account_id: 'a', call_id: 'a', to: 'a', from: 'a', call_url: 'a', answer_url: 'a', fallback_password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
    end
  end
end
