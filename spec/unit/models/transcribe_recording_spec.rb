# Unit tests for Bandwidth::TranscribeRecording
describe Bandwidth::TranscribeRecording do
  let(:transcribe_recording_default) { Bandwidth::TranscribeRecording.new }
  let(:transcribe_recording_values) { Bandwidth::TranscribeRecording.new({
    callback_url: 'https://example.com/callback',
    callback_method: Bandwidth::CallbackMethodEnum::POST,
    username: 'mySecretUsername',
    password: 'mySecretPassword',
    tag: 'arbitrary tag',
    callback_timeout: 5.5,
    detect_language: true
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::TranscribeRecording.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::TranscribeRecording.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::TranscribeRecording.acceptable_attributes).to eq(Bandwidth::TranscribeRecording.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::TranscribeRecording.openapi_nullable).to eq(Set.new([
        :'callback_method',
        :'username',
        :'password',
        :'tag',
        :'callback_timeout',
        :'detect_language'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of TranscribeRecording created by the build_from_hash method' do
      transcribe_recording_from_hash = Bandwidth::TranscribeRecording.build_from_hash({
        callbackUrl: 'https://example.com/callback',
        callbackMethod: Bandwidth::CallbackMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword',
        tag: 'arbitrary tag',
        callbackTimeout: 5.5,
        detectLanguage: true
      })
      expect(transcribe_recording_from_hash).to be_instance_of(Bandwidth::TranscribeRecording)
      expect(transcribe_recording_from_hash.callback_url).to eq('https://example.com/callback')
      expect(transcribe_recording_from_hash.callback_method).to eq(Bandwidth::CallbackMethodEnum::POST)
      expect(transcribe_recording_from_hash.username).to eq('mySecretUsername')
      expect(transcribe_recording_from_hash.password).to eq('mySecretPassword')
      expect(transcribe_recording_from_hash.tag).to eq('arbitrary tag')
      expect(transcribe_recording_from_hash.callback_timeout).to eq(5.5)
      expect(transcribe_recording_from_hash.detect_language).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(transcribe_recording_values.to_s).to eq('{:callbackUrl=>"https://example.com/callback", :callbackMethod=>"POST", :username=>"mySecretUsername", :password=>"mySecretPassword", :tag=>"arbitrary tag", :callbackTimeout=>5.5, :detectLanguage=>true}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(transcribe_recording_default.eql?(Bandwidth::TranscribeRecording.new)).to be true
      expect(transcribe_recording_default.eql?(transcribe_recording_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(transcribe_recording_values.to_body).to eq({
        callbackUrl: 'https://example.com/callback',
        callbackMethod: Bandwidth::CallbackMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword',
        tag: 'arbitrary tag',
        callbackTimeout: 5.5,
        detectLanguage: true
      })
    end
  end

  describe 'custom attribute writers' do
    it '#username=' do
      expect {
        Bandwidth::TranscribeRecording.new({ username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.')
    end

    it '#password=' do
      expect {
        Bandwidth::TranscribeRecording.new({ password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.')
    end

    it '#callback_timeout=' do
      expect {
        Bandwidth::TranscribeRecording.new({ callback_timeout: 26 })
      }.to raise_error(ArgumentError, 'invalid value for "callback_timeout", must be smaller than or equal to 25.')

      expect {
        Bandwidth::TranscribeRecording.new({ callback_timeout: 0.5 })
      }.to raise_error(ArgumentError, 'invalid value for "callback_timeout", must be greater than or equal to 1.')
    end
  end
end
