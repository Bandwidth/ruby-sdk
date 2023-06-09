require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Conference
describe 'Bandwidth::Bxml::Conference' do
  let(:initial_attributes) {
    {
      mute: true,
      hold: true,
      call_ids_to_coach: 'initial',
      conference_event_url: 'https://initial.com',
      conference_event_method: 'POST',
      conference_event_fallback_url: 'https://initial.com',
      conference_event_fallback_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag',
      callback_timeout: 5.0
    }
  }

  let(:new_attributes) {
    {
      mute: false,
      hold: false,
      call_ids_to_coach: 'new',
      conference_event_url: 'https://new.com',
      conference_event_method: 'GET',
      conference_event_fallback_url: 'https://new.com',
      conference_event_fallback_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag',
      callback_timeout: 10.0
    }
  }

  let(:instance) { Bandwidth::Bxml::Conference.new('conference_name', initial_attributes) }

  describe 'test an instance of Conference' do
    it 'validates instance of Conference' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Conference)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Conference instance' do
      expected = "\n<Conference mute=\"true\" hold=\"true\" callIdsToCoach=\"initial\" conferenceEventUrl=\"https://initial.com\" conferenceEventMethod=\"POST\" conferenceEventFallbackUrl=\"https://initial.com\" conferenceEventFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" callbackTimeout=\"5.0\">conference_name</Conference>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Conference instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Conference mute=\"false\" hold=\"false\" callIdsToCoach=\"new\" conferenceEventUrl=\"https://new.com\" conferenceEventMethod=\"GET\" conferenceEventFallbackUrl=\"https://new.com\" conferenceEventFallbackMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\" callbackTimeout=\"10.0\">conference_name</Conference>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
