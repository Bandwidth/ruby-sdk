

# Unit tests for Bandwidth::Bxml::SipUri
describe 'Bandwidth::Bxml::SipUri' do
  let(:initial_attributes) {
    {
      uui: 'abc123',
      transfer_answer_url: 'https://initial.com',
      transfer_answer_method: 'POST',
      transfer_answer_fallback_url: 'https://initial.com',
      transfer_answer_fallback_method: 'POST',
      transfer_disconnect_url: 'https://initial.com',
      transfer_disconnect_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag'
    }
  }

  let(:new_attributes) {
    {
      uui: '123abc',
      transfer_answer_url: 'https://new.com',
      transfer_answer_method: 'GET',
      transfer_answer_fallback_url: 'https://new.com',
      transfer_answer_fallback_method: 'GET',
      transfer_disconnect_url: 'https://new.com',
      transfer_disconnect_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag'
    }
  }

  let(:instance) { Bandwidth::Bxml::SipUri.new('sip:1-999-123-4567@voip-provider.example.net', initial_attributes) }

  describe 'test an instance of SipUri' do
    it 'validates instance of SipUri' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::SipUri)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the SipUri instance' do
      expected = "\n<SipUri uui=\"abc123\" transferAnswerUrl=\"https://initial.com\" transferAnswerMethod=\"POST\" transferAnswerFallbackUrl=\"https://initial.com\" transferAnswerFallbackMethod=\"POST\" transferDisconnectUrl=\"https://initial.com\" transferDisconnectMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\">sip:1-999-123-4567@voip-provider.example.net</SipUri>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the SipUri instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<SipUri uui=\"123abc\" transferAnswerUrl=\"https://new.com\" transferAnswerMethod=\"GET\" transferAnswerFallbackUrl=\"https://new.com\" transferAnswerFallbackMethod=\"GET\" transferDisconnectUrl=\"https://new.com\" transferDisconnectMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\">sip:1-999-123-4567@voip-provider.example.net</SipUri>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
