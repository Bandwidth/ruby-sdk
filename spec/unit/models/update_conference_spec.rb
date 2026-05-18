# Unit tests for Bandwidth::UpdateConference
describe Bandwidth::UpdateConference do
  let(:update_conference_default) { Bandwidth::UpdateConference.new }
  let(:update_conference_values) { Bandwidth::UpdateConference.new({
    status: Bandwidth::ConferenceStateEnum::ACTIVE,
    redirect_url: 'https://example.com/redirect',
    redirect_method: Bandwidth::RedirectMethodEnum::POST,
    username: 'mySecretUsername',
    password: 'mySecretPassword',
    redirect_fallback_url: 'https://example.com/fallback',
    redirect_fallback_method: Bandwidth::RedirectMethodEnum::GET,
    fallback_username: 'fallbackUser',
    fallback_password: 'fallbackPass'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::UpdateConference.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::UpdateConference.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::UpdateConference.acceptable_attributes).to eq(Bandwidth::UpdateConference.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::UpdateConference.openapi_nullable).to eq(Set.new([
        :'status',
        :'redirect_url',
        :'redirect_method',
        :'username',
        :'password',
        :'redirect_fallback_url',
        :'redirect_fallback_method',
        :'fallback_username',
        :'fallback_password'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of UpdateConference created by the build_from_hash method' do
      update_conference_from_hash = Bandwidth::UpdateConference.build_from_hash({
        status: Bandwidth::ConferenceStateEnum::ACTIVE,
        redirectUrl: 'https://example.com/redirect',
        redirectMethod: Bandwidth::RedirectMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword',
        redirectFallbackUrl: 'https://example.com/fallback',
        redirectFallbackMethod: Bandwidth::RedirectMethodEnum::GET,
        fallbackUsername: 'fallbackUser',
        fallbackPassword: 'fallbackPass'
      })
      expect(update_conference_from_hash).to be_instance_of(Bandwidth::UpdateConference)
      expect(update_conference_from_hash.status).to eq(Bandwidth::ConferenceStateEnum::ACTIVE)
      expect(update_conference_from_hash.redirect_url).to eq('https://example.com/redirect')
      expect(update_conference_from_hash.redirect_method).to eq(Bandwidth::RedirectMethodEnum::POST)
      expect(update_conference_from_hash.username).to eq('mySecretUsername')
      expect(update_conference_from_hash.password).to eq('mySecretPassword')
      expect(update_conference_from_hash.redirect_fallback_url).to eq('https://example.com/fallback')
      expect(update_conference_from_hash.redirect_fallback_method).to eq(Bandwidth::RedirectMethodEnum::GET)
      expect(update_conference_from_hash.fallback_username).to eq('fallbackUser')
      expect(update_conference_from_hash.fallback_password).to eq('fallbackPass')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(update_conference_values.to_s).to eq('{:status=>"active", :redirectUrl=>"https://example.com/redirect", :redirectMethod=>"POST", :username=>"mySecretUsername", :password=>"mySecretPassword", :redirectFallbackUrl=>"https://example.com/fallback", :redirectFallbackMethod=>"GET", :fallbackUsername=>"fallbackUser", :fallbackPassword=>"fallbackPass"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(update_conference_default.eql?(Bandwidth::UpdateConference.new)).to be true
      expect(update_conference_default.eql?(update_conference_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(update_conference_values.to_body).to eq({
        status: Bandwidth::ConferenceStateEnum::ACTIVE,
        redirectUrl: 'https://example.com/redirect',
        redirectMethod: Bandwidth::RedirectMethodEnum::POST,
        username: 'mySecretUsername',
        password: 'mySecretPassword',
        redirectFallbackUrl: 'https://example.com/fallback',
        redirectFallbackMethod: Bandwidth::RedirectMethodEnum::GET,
        fallbackUsername: 'fallbackUser',
        fallbackPassword: 'fallbackPass'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#username=' do
      expect {
        Bandwidth::UpdateConference.new({ username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "username", the character length must be smaller than or equal to 1024.')
    end

    it '#password=' do
      expect {
        Bandwidth::UpdateConference.new({ password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "password", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_username=' do
      expect {
        Bandwidth::UpdateConference.new({ fallback_username: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_username", the character length must be smaller than or equal to 1024.')
    end

    it '#fallback_password=' do
      expect {
        Bandwidth::UpdateConference.new({ fallback_password: 'a' * 1025 })
      }.to raise_error(ArgumentError, 'invalid value for "fallback_password", the character length must be smaller than or equal to 1024.')
    end
  end
end
