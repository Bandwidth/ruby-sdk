require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Bridge
describe 'Bandwidth::Bxml::Bridge' do
  let(:instance) { Bandwidth::Bxml::Bridge.new('+19198675309', {bridge_complete_url:  'https://example.com', tag: 'ruby bridge init tag'}) }

  describe 'test an instance of Bridge' do
    it 'validates instance of Bridge' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Bridge)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'test the to_bxml method of the Bridge instance' do
      expected = "\n<Bridge bridgeCompleteUrl=\"https://example.com\" tag=\"ruby bridge init tag\">+19198675309</Bridge>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test the set_attributes method of the Bridge instance' do
      attributes = {'bridge_complete_method' => 'POST', 'tag' => 'ruby bridge set tag'}
      instance.set_attributes(attributes)
      expected = "\n<Bridge bridgeCompleteMethod=\"POST\" tag=\"ruby bridge set tag\">+19198675309</Bridge>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test invalid attribute' do
      attributes = {'invalid_attribute' => 'invalid'}
      instance.set_attributes(attributes)

      expect {
        instance.generate_xml
      }.to raise_error { |e|
        expect(e).to be_a(NoMethodError)
      }
    end
  end
end
