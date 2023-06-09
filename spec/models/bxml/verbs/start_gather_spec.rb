require 'spec_helper'

# Unit tests for Bandwidth::Bxml::StartGather
describe 'Bandwidth::Bxml::StartGather' do
  let(:initial_attributes) {
    {
      dtmf_url: 'https://initial.com',
      dtmf_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      tag: 'initial_tag'
    }
  }

  let(:new_attributes) {
    {
      dtmf_url: 'https://new.com',
      dtmf_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      tag: 'new_tag'
    }
  }

  let(:instance) { Bandwidth::Bxml::StartGather.new(initial_attributes) }

  describe 'test an instance of StartGather' do
    it 'validates instance of StartGather' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StartGather)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StartGather instance' do
      expected = "\n<StartGather dtmfUrl=\"https://initial.com\" dtmfMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" tag=\"initial_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StartGather instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StartGather dtmfUrl=\"https://new.com\" dtmfMethod=\"GET\" username=\"new_username\" password=\"new_password\" tag=\"new_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
