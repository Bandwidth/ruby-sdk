# Unit tests for Bandwidth::Bxml::Connect
describe 'Bandwidth::Bxml::Connect' do
  let(:initial_attributes) {
    {
      event_callback_url: 'https://initial.com',
      event_fallback_url: 'https://initial.com'
    }
  }

  let(:new_attributes) {
    {
      event_callback_url: 'https://new.com',
      event_fallback_url: 'https://new.com'
    }
  }

  let(:endpoint_1) { Bandwidth::Bxml::Endpoint.new('endpoint_id_1') }
  let(:endpoint_2) { Bandwidth::Bxml::Endpoint.new('endpoint_id_2') }

  let(:instance) { Bandwidth::Bxml::Connect.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::Connect.new(endpoint_1, initial_attributes) }

  describe 'test an instance of Connect' do
    it 'validates instance of Connect' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Connect)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Connect instance' do
      expected = "\n<Connect eventCallbackUrl=\"https://initial.com\" eventFallbackUrl=\"https://initial.com\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Connect instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Connect eventCallbackUrl=\"https://new.com\" eventFallbackUrl=\"https://new.com\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of Connect with nested verbs' do
    it 'validates instance of Connect' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::Connect)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested Connect instance' do
      expected = "\n<Connect eventCallbackUrl=\"https://initial.com\" eventFallbackUrl=\"https://initial.com\">\n  <Endpoint>endpoint_id_1</Endpoint>\n</Connect>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_endpoints method of the nested Connect instance' do
      expected_single = "\n<Connect eventCallbackUrl=\"https://initial.com\" eventFallbackUrl=\"https://initial.com\">\n  <Endpoint>endpoint_id_1</Endpoint>\n  <Endpoint>endpoint_id_2</Endpoint>\n</Connect>\n"
      instance_nested.add_endpoints(endpoint_2)
      expect(instance_nested.to_bxml).to eq(expected_single)

      expected_multiple = "\n<Connect eventCallbackUrl=\"https://initial.com\" eventFallbackUrl=\"https://initial.com\">\n  <Endpoint>endpoint_id_1</Endpoint>\n  <Endpoint>endpoint_id_2</Endpoint>\n  <Endpoint>endpoint_id_2</Endpoint>\n  <Endpoint>endpoint_id_1</Endpoint>\n</Connect>\n"
      instance_nested.add_endpoints([endpoint_2, endpoint_1])
      expect(instance_nested.to_bxml).to eq(expected_multiple)
    end
  end
end
