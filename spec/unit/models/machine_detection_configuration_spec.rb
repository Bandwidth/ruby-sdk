# Unit tests for Bandwidth::MachineDetectionConfiguration
describe Bandwidth::MachineDetectionConfiguration do
  let(:machine_detection_configuration_default) { Bandwidth::MachineDetectionConfiguration.new }
  let(:machine_detection_configuration_values) { Bandwidth::MachineDetectionConfiguration.new({
    mode: Bandwidth::MachineDetectionModeEnum::SYNC,
    detection_timeout: 20,
    silence_timeout: 12,
    speech_threshold: 8,
    speech_end_threshold: 4,
    machine_speech_end_threshold: 7,
    delay_result: true,
    callback_url: 'https://example.com/callback',
    callback_method: Bandwidth::CallbackMethodEnum::GET,
    username: 'user',
    password: 'pass',
    fallback_url: 'https://example.com/fallback',
    fallback_method: Bandwidth::CallbackMethodEnum::GET,
    fallback_username: 'fallback-user',
    fallback_password: 'fallback-pass'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MachineDetectionConfiguration.acceptable_attributes).to eq(Bandwidth::MachineDetectionConfiguration.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::MachineDetectionConfiguration.openapi_nullable).to eq(Set.new([
        :'detection_timeout',
        :'silence_timeout',
        :'speech_threshold',
        :'speech_end_threshold',
        :'machine_speech_end_threshold',
        :'delay_result',
        :'callback_url',
        :'callback_method',
        :'username',
        :'password',
        :'fallback_url',
        :'fallback_method',
        :'fallback_username',
        :'fallback_password'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MachineDetectionConfiguration created by the build_from_hash method' do
      machine_detection_configuration_from_hash = Bandwidth::MachineDetectionConfiguration.build_from_hash({
        mode: 'sync',
        detectionTimeout: 20,
        silenceTimeout: 12,
        speechThreshold: 8,
        speechEndThreshold: 4,
        machineSpeechEndThreshold: 7,
        delayResult: true,
        callbackUrl: 'https://example.com/callback',
        callbackMethod: 'GET',
        username: 'user',
        password: 'pass',
        fallbackUrl: 'https://example.com/fallback',
        fallbackMethod: 'GET',
        fallbackUsername: 'fallback-user',
        fallbackPassword: 'fallback-pass'
      })
      expect(machine_detection_configuration_from_hash).to be_instance_of(Bandwidth::MachineDetectionConfiguration)
      expect(machine_detection_configuration_from_hash.mode).to eq('sync')
      expect(machine_detection_configuration_from_hash.detection_timeout).to eq(20.0)
      expect(machine_detection_configuration_from_hash.silence_timeout).to eq(12.0)
      expect(machine_detection_configuration_from_hash.speech_threshold).to eq(8.0)
      expect(machine_detection_configuration_from_hash.speech_end_threshold).to eq(4.0)
      expect(machine_detection_configuration_from_hash.machine_speech_end_threshold).to eq(7.0)
      expect(machine_detection_configuration_from_hash.delay_result).to eq(true)
      expect(machine_detection_configuration_from_hash.callback_url).to eq('https://example.com/callback')
      expect(machine_detection_configuration_from_hash.callback_method).to eq('GET')
      expect(machine_detection_configuration_from_hash.username).to eq('user')
      expect(machine_detection_configuration_from_hash.password).to eq('pass')
      expect(machine_detection_configuration_from_hash.fallback_url).to eq('https://example.com/fallback')
      expect(machine_detection_configuration_from_hash.fallback_method).to eq('GET')
      expect(machine_detection_configuration_from_hash.fallback_username).to eq('fallback-user')
      expect(machine_detection_configuration_from_hash.fallback_password).to eq('fallback-pass')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(machine_detection_configuration_values.to_s).to eq('{:mode=>"sync", :detectionTimeout=>20, :silenceTimeout=>12, :speechThreshold=>8, :speechEndThreshold=>4, :machineSpeechEndThreshold=>7, :delayResult=>true, :callbackUrl=>"https://example.com/callback", :callbackMethod=>"GET", :username=>"user", :password=>"pass", :fallbackUrl=>"https://example.com/fallback", :fallbackMethod=>"GET", :fallbackUsername=>"fallback-user", :fallbackPassword=>"fallback-pass"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(machine_detection_configuration_default.eql?(Bandwidth::MachineDetectionConfiguration.new)).to be true
      expect(machine_detection_configuration_default.eql?(machine_detection_configuration_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(machine_detection_configuration_values.to_body).to eq({
        mode: Bandwidth::MachineDetectionModeEnum::SYNC,
        detectionTimeout: 20,
        silenceTimeout: 12,
        speechThreshold: 8,
        speechEndThreshold: 4,
        machineSpeechEndThreshold: 7,
        delayResult: true,
        callbackUrl: 'https://example.com/callback',
        callbackMethod: Bandwidth::CallbackMethodEnum::GET,
        username: 'user',
        password: 'pass',
        fallbackUrl: 'https://example.com/fallback',
        fallbackMethod: Bandwidth::CallbackMethodEnum::GET,
        fallbackUsername: 'fallback-user',
        fallbackPassword: 'fallback-pass'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#callback_url=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ callback_url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "callback_url", the character length must be smaller than or equal to 2048.')
    end

    it '#username=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.')
    end

    it '#password=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_url=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ fallback_url: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_url", the character length must be smaller than or equal to 2048.')
    end

    it '#fallback_username=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ fallback_username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_password=' do
      expect {
        Bandwidth::MachineDetectionConfiguration.new({ fallback_password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
    end
  end
end
