# Unit tests for Bandwidth::Bxml::Bridge
describe 'Bandwidth::Bxml::Bridge' do
  let(:initial_attributes) {
    {
      bridge_complete_url: 'https://initial.com',
      bridge_complete_method: 'POST',
      bridge_complete_fallback_url: 'https://initial.com',
      bridge_complete_fallback_method: 'POST',
      bridge_target_complete_url: 'https://initial.com',
      bridge_target_complete_method: 'POST',
      bridge_target_complete_fallback_url: 'https://initial.com',
      bridge_target_complete_fallback_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag'
    }
  }

  let(:new_attributes) {
    {
      bridge_complete_url: 'https://new.com',
      bridge_complete_method: 'GET',
      bridge_complete_fallback_url: 'https://new.com',
      bridge_complete_fallback_method: 'GET',
      bridge_target_complete_url: 'https://new.com',
      bridge_target_complete_method: 'GET',
      bridge_target_complete_fallback_url: 'https://new.com',
      bridge_target_complete_fallback_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag'
    }
  }

  let(:instance) { Bandwidth::Bxml::Bridge.new('c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d', initial_attributes) }

  describe 'test an instance of Bridge' do
    it 'validates instance of Bridge' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Bridge)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Bridge instance' do
      expected = "\n<Bridge bridgeCompleteUrl=\"https://initial.com\" bridgeCompleteMethod=\"POST\" bridgeCompleteFallbackUrl=\"https://initial.com\" bridgeCompleteFallbackMethod=\"POST\" bridgeTargetCompleteUrl=\"https://initial.com\" bridgeTargetCompleteMethod=\"POST\" bridgeTargetCompleteFallbackUrl=\"https://initial.com\" bridgeTargetCompleteFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\">c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d</Bridge>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Bridge instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Bridge bridgeCompleteUrl=\"https://new.com\" bridgeCompleteMethod=\"GET\" bridgeCompleteFallbackUrl=\"https://new.com\" bridgeCompleteFallbackMethod=\"GET\" bridgeTargetCompleteUrl=\"https://new.com\" bridgeTargetCompleteMethod=\"GET\" bridgeTargetCompleteFallbackUrl=\"https://new.com\" bridgeTargetCompleteFallbackMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\">c-95ac8d6e-1a31c52e-b38f-4198-93c1-51633ec68f8d</Bridge>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
