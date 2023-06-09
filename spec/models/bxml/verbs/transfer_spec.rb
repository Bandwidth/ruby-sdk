require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Transfer
describe 'Bandwidth::Bxml::Transfer' do
  let(:initial_attributes) {
    {
      transfer_caller_id: '+19195551234',
      call_timeout: 5,
      transfer_complete_url: 'https://initial.com',
      transfer_complete_method: 'POST',
      transfer_complete_fallback_url: 'https://initial.com',
      transfer_complete_fallback_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag',
      diversion_treatment: 'propogate',
      diversion_reason: 'user-busy'
    }
  }

  let(:new_attributes) {
    {
      transfer_caller_id: '+19195554321',
      call_timeout: 10,
      transfer_complete_url: 'https://new.com',
      transfer_complete_method: 'POST',
      transfer_complete_fallback_url: 'https://new.com',
      transfer_complete_fallback_method: 'POST',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag',
      diversion_treatment: 'stack',
      diversion_reason: 'no-answer'
    }
  }

  let(:phone_number) { Bandwidth::Bxml::PhoneNumber.new('+19195551234') }
  let(:sip_uri) { Bandwidth::Bxml::SipUri.new('sip:1-999-123-4567@voip-provider.example.net') }

  let(:instance) { Bandwidth::Bxml::Transfer.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::Transfer.new([phone_number], initial_attributes) }

  describe 'test an instance of Transfer' do
    it 'validates instance of Transfer' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Transfer)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Transfer instance' do
      expected = "\n<Transfer transferCallerId=\"+19195551234\" callTimeout=\"5\" transferCompleteUrl=\"https://initial.com\" transferCompleteMethod=\"POST\" transferCompleteFallbackUrl=\"https://initial.com\" transferCompleteFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" diversionTreatment=\"propogate\" diversionReason=\"user-busy\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Transfer instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Transfer transferCallerId=\"+19195554321\" callTimeout=\"10\" transferCompleteUrl=\"https://new.com\" transferCompleteMethod=\"POST\" transferCompleteFallbackUrl=\"https://new.com\" transferCompleteFallbackMethod=\"POST\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\" diversionTreatment=\"stack\" diversionReason=\"no-answer\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of Transfer with nested verbs' do
    it 'validates instance of Transfer' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::Transfer)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested Transfer instance' do
      expected = "\n<Transfer transferCallerId=\"+19195551234\" callTimeout=\"5\" transferCompleteUrl=\"https://initial.com\" transferCompleteMethod=\"POST\" transferCompleteFallbackUrl=\"https://initial.com\" transferCompleteFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" diversionTreatment=\"propogate\" diversionReason=\"user-busy\">\n  <PhoneNumber>+19195551234</PhoneNumber>\n</Transfer>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_verb method of the nested Transfer instance' do
      expected_single = "\n<Transfer transferCallerId=\"+19195551234\" callTimeout=\"5\" transferCompleteUrl=\"https://initial.com\" transferCompleteMethod=\"POST\" transferCompleteFallbackUrl=\"https://initial.com\" transferCompleteFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" diversionTreatment=\"propogate\" diversionReason=\"user-busy\">\n  <PhoneNumber>+19195551234</PhoneNumber>\n  <SipUri>sip:1-999-123-4567@voip-provider.example.net</SipUri>\n</Transfer>\n"
      instance_nested.add_transfer_recipient(sip_uri)
      expect(instance_nested.to_bxml).to eq(expected_single)

      expected_multiple = "\n<Transfer transferCallerId=\"+19195551234\" callTimeout=\"5\" transferCompleteUrl=\"https://initial.com\" transferCompleteMethod=\"POST\" transferCompleteFallbackUrl=\"https://initial.com\" transferCompleteFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" diversionTreatment=\"propogate\" diversionReason=\"user-busy\">\n  <PhoneNumber>+19195551234</PhoneNumber>\n  <SipUri>sip:1-999-123-4567@voip-provider.example.net</SipUri>\n  <SipUri>sip:1-999-123-4567@voip-provider.example.net</SipUri>\n  <PhoneNumber>+19195551234</PhoneNumber>\n</Transfer>\n"
      instance_nested.add_transfer_recipient([sip_uri, phone_number])
      expect(instance_nested.to_bxml).to eq(expected_multiple)
    end
  end
end
