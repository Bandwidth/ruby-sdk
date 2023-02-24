require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Response
describe 'Bandwidth::Bxml::Response' do
  let(:instance) { Bandwidth::Bxml::Response.new }

  describe 'test an instance of Response' do
    it 'validates instance of Response' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Response)
    end

    it 'test the to_bxml method of the Response instance' do
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
