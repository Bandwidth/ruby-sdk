# Unit tests for Bandwidth::CreateCall
describe Bandwidth::CreateCall do
  let(:create_call_default) { Bandwidth::CreateCall.new({
    to: '+19195550100',
    from: '+19195550101',
    application_id: 'baseline-app',
    answer_url: 'https://example.com/answer/baseline'
  }) }
  let(:create_call_values) { Bandwidth::CreateCall.new({
    to: '+19195551234',
    from: '+19195554321',
    privacy: false,
    display_name: 'Caller Name',
    uui: 'eyJ0eXAiOiJKV1Q;encoding=jwt',
    application_id: '04e88489-df02-4e34-a0ee-27a91849555f',
    answer_url: 'https://example.com/answer',
    answer_method: Bandwidth::CallbackMethodEnum::POST,
    username: 'user',
    password: 'pass',
    answer_fallback_url: 'https://example.com/answer-fallback',
    answer_fallback_method: Bandwidth::CallbackMethodEnum::POST,
    fallback_username: 'fallback_user',
    fallback_password: 'fallback_pass',
    disconnect_url: 'https://example.com/disconnect',
    disconnect_method: Bandwidth::CallbackMethodEnum::POST,
    call_timeout: 30,
    callback_timeout: 15,
    machine_detection: {},
    priority: 5,
    tag: 'custom tag'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::CreateCall.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::CreateCall.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::CreateCall.acceptable_attributes).to eq(Bandwidth::CreateCall.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::CreateCall.openapi_nullable).to eq(Set.new([
        :'privacy',
        :'display_name',
        :'uui',
        :'answer_method',
        :'username',
        :'password',
        :'answer_fallback_url',
        :'answer_fallback_method',
        :'fallback_username',
        :'fallback_password',
        :'disconnect_url',
        :'disconnect_method',
        :'call_timeout',
        :'callback_timeout',
        :'priority',
        :'tag'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of CreateCall created by the build_from_hash method' do
      create_call_from_hash = Bandwidth::CreateCall.build_from_hash({
        to: '+19195551234',
        from: '+19195554321',
        privacy: false,
        displayName: 'Caller Name',
        uui: 'eyJ0eXAiOiJKV1Q;encoding=jwt',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        answerUrl: 'https://example.com/answer',
        answerMethod: 'POST',
        username: 'user',
        password: 'pass',
        answerFallbackUrl: 'https://example.com/answer-fallback',
        answerFallbackMethod: 'POST',
        fallbackUsername: 'fallback_user',
        fallbackPassword: 'fallback_pass',
        disconnectUrl: 'https://example.com/disconnect',
        disconnectMethod: 'POST',
        callTimeout: 30,
        callbackTimeout: 15,
        priority: 5,
        tag: 'custom tag'
      })
      expect(create_call_from_hash).to be_instance_of(Bandwidth::CreateCall)
      expect(create_call_from_hash.to).to eq('+19195551234')
      expect(create_call_from_hash.from).to eq('+19195554321')
      expect(create_call_from_hash.privacy).to eq(false)
      expect(create_call_from_hash.display_name).to eq('Caller Name')
      expect(create_call_from_hash.uui).to eq('eyJ0eXAiOiJKV1Q;encoding=jwt')
      expect(create_call_from_hash.application_id).to eq('04e88489-df02-4e34-a0ee-27a91849555f')
      expect(create_call_from_hash.answer_url).to eq('https://example.com/answer')
      expect(create_call_from_hash.answer_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_from_hash.username).to eq('user')
      expect(create_call_from_hash.password).to eq('pass')
      expect(create_call_from_hash.answer_fallback_url).to eq('https://example.com/answer-fallback')
      expect(create_call_from_hash.answer_fallback_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_from_hash.fallback_username).to eq('fallback_user')
      expect(create_call_from_hash.fallback_password).to eq('fallback_pass')
      expect(create_call_from_hash.disconnect_url).to eq('https://example.com/disconnect')
      expect(create_call_from_hash.disconnect_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(create_call_from_hash.call_timeout).to eq(30)
      expect(create_call_from_hash.callback_timeout).to eq(15)
      expect(create_call_from_hash.priority).to eq(5)
      expect(create_call_from_hash.tag).to eq('custom tag')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(create_call_values.to_s).to eq('{:to=>"+19195551234", :from=>"+19195554321", :privacy=>false, :displayName=>"Caller Name", :uui=>"eyJ0eXAiOiJKV1Q;encoding=jwt", :applicationId=>"04e88489-df02-4e34-a0ee-27a91849555f", :answerUrl=>"https://example.com/answer", :answerMethod=>"POST", :username=>"user", :password=>"pass", :answerFallbackUrl=>"https://example.com/answer-fallback", :answerFallbackMethod=>"POST", :fallbackUsername=>"fallback_user", :fallbackPassword=>"fallback_pass", :disconnectUrl=>"https://example.com/disconnect", :disconnectMethod=>"POST", :callTimeout=>30, :callbackTimeout=>15, :machineDetection=>{}, :priority=>5, :tag=>"custom tag"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      create_call_equal = Bandwidth::CreateCall.new({
        to: '+19195550100',
        from: '+19195550101',
        application_id: 'baseline-app',
        answer_url: 'https://example.com/answer/baseline'
      })
      expect(create_call_default.eql?(create_call_equal)).to be true
      expect(create_call_default.eql?(create_call_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(create_call_values.to_body).to eq({
        to: '+19195551234',
        from: '+19195554321',
        privacy: false,
        displayName: 'Caller Name',
        uui: 'eyJ0eXAiOiJKV1Q;encoding=jwt',
        applicationId: '04e88489-df02-4e34-a0ee-27a91849555f',
        answerUrl: 'https://example.com/answer',
        answerMethod: Bandwidth::CallbackMethodEnum::POST,
        username: 'user',
        password: 'pass',
        answerFallbackUrl: 'https://example.com/answer-fallback',
        answerFallbackMethod: Bandwidth::CallbackMethodEnum::POST,
        fallbackUsername: 'fallback_user',
        fallbackPassword: 'fallback_pass',
        disconnectUrl: 'https://example.com/disconnect',
        disconnectMethod: Bandwidth::CallbackMethodEnum::POST,
        callTimeout: 30,
        callbackTimeout: 15,
        machineDetection: {},
        priority: 5,
        tag: 'custom tag'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#to=' do
      expect {
        Bandwidth::CreateCall.new({ to: nil, from: 'a', application_id: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'to cannot be nil')
    end

    it '#from=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: nil, application_id: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'from cannot be nil')
    end

    it '#display_name=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', display_name: 'a' * 257, application_id: 'a', answer_url: 'a' })
      }.to raise_error(ArgumentError, 'invalid value for "display_name", the character length must be smaller than or equal to 256.')
    end

    it '#application_id=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: nil, answer_url: 'a' })
      }.to raise_error(ArgumentError, 'application_id cannot be nil')
    end

    it '#answer_url=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: nil })
      }.to raise_error(ArgumentError, 'answer_url cannot be nil')

      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "answer_url", the character length must be smaller than or equal to 2048.')
    end

    it '#username=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.')
    end

    it '#password=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.')
    end

    it '#answer_fallback_url=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', answer_fallback_url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "answer_fallback_url", the character length must be smaller than or equal to 2048.')
    end

    it '#fallback_username=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', fallback_username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_password=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', fallback_password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
    end

    it '#disconnect_url=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', disconnect_url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "disconnect_url", the character length must be smaller than or equal to 2048.')
    end

    it '#call_timeout=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', call_timeout: 301 })
      }.to raise_error(ArgumentError, 'invalid value for "call_timeout", must be smaller than or equal to 300.')

      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', call_timeout: 0 })
      }.to raise_error(ArgumentError, 'invalid value for "call_timeout", must be greater than or equal to 1.')
    end

    it '#callback_timeout=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', callback_timeout: 26 })
      }.to raise_error(ArgumentError, 'invalid value for "callback_timeout", must be smaller than or equal to 25.')

      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', callback_timeout: 0 })
      }.to raise_error(ArgumentError, 'invalid value for "callback_timeout", must be greater than or equal to 1.')
    end

    it '#priority=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', priority: 6 })
      }.to raise_error(ArgumentError, 'invalid value for "priority", must be smaller than or equal to 5.')

      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', priority: 0 })
      }.to raise_error(ArgumentError, 'invalid value for "priority", must be greater than or equal to 1.')
    end

    it '#tag=' do
      expect {
        Bandwidth::CreateCall.new({ to: 'a', from: 'a', application_id: 'a', answer_url: 'a', tag: 'a' * 4097 })
      }.to raise_error(ArgumentError, 'invalid value for "tag", the character length must be smaller than or equal to 4096.')
    end
  end
end
