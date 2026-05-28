# Unit tests for Bandwidth::Bxml::Refer
describe 'Bandwidth::Bxml::Refer' do
  let(:initial_attributes) {
    {
      refer_complete_url: 'https://example.com/handleRefer',
      refer_complete_method: 'POST',
      tag: 'initial_tag'
    }
  }

  let(:new_attributes) {
    {
      refer_complete_url: 'https://new.com/handleRefer',
      refer_complete_method: 'GET',
      tag: 'new_tag'
    }
  }

  let(:sip_uri) { Bandwidth::Bxml::SipUri.new('sip:alice@atlanta.example.com') }

  let(:instance) { Bandwidth::Bxml::Refer.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::Refer.new(sip_uri, initial_attributes) }

  describe 'test an instance of Refer' do
    it 'validates instance of Refer' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Refer)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Refer instance' do
      expected = "\n<Refer referCompleteUrl=\"https://example.com/handleRefer\" referCompleteMethod=\"POST\" tag=\"initial_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Refer instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Refer referCompleteUrl=\"https://new.com/handleRefer\" referCompleteMethod=\"GET\" tag=\"new_tag\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of Refer with nested SipUri' do
    it 'validates instance of Refer' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::Refer)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested Refer instance' do
      expected = "\n<Refer referCompleteUrl=\"https://example.com/handleRefer\" referCompleteMethod=\"POST\" tag=\"initial_tag\">\n  <SipUri>sip:alice@atlanta.example.com</SipUri>\n</Refer>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_sip_uri method of the nested Refer instance' do
      sip_uri_2 = Bandwidth::Bxml::SipUri.new('sip:bob@biloxi.example.com')
      instance_nested.add_sip_uri(sip_uri_2)
      expected = "\n<Refer referCompleteUrl=\"https://example.com/handleRefer\" referCompleteMethod=\"POST\" tag=\"initial_tag\">\n  <SipUri>sip:alice@atlanta.example.com</SipUri>\n  <SipUri>sip:bob@biloxi.example.com</SipUri>\n</Refer>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end
  end
end

