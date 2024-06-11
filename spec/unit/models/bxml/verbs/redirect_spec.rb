# Unit tests for Bandwidth::Bxml::Redirect
describe 'Bandwidth::Bxml::Redirect' do
  let(:initial_attributes) {
    {
      redirect_url: 'https://initial.com',
      redirect_method: 'POST',
      redirect_fallback_url: 'https://initial.com',
      redirect_fallback_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag'
    }
  }

  let(:new_attributes) {
    {
      redirect_url: 'https://new.com',
      redirect_method: 'GET',
      redirect_fallback_url: 'https://new.com',
      redirect_fallback_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag'
    }
  }

  let(:instance) { Bandwidth::Bxml::Redirect.new(initial_attributes) }

  describe 'test an instance of Redirect' do
    it 'validates instance of Redirect' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Redirect)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Redirect instance' do
      expected = "\n<Redirect redirectUrl=\"https://initial.com\" redirectMethod=\"POST\" redirectFallbackUrl=\"https://initial.com\" redirectFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Redirect instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Redirect redirectUrl=\"https://new.com\" redirectMethod=\"GET\" redirectFallbackUrl=\"https://new.com\" redirectFallbackMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
