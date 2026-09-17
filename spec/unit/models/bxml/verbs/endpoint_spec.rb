# Unit tests for Bandwidth::Bxml::Endpoint
describe 'Bandwidth::Bxml::Endpoint' do
  let(:instance) { Bandwidth::Bxml::Endpoint.new('test_endpoint_id') }

  describe 'test an instance of Endpoint' do
    it 'validates instance of Endpoint' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Endpoint)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Endpoint instance' do
      expected = "\n<Endpoint>test_endpoint_id</Endpoint>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
