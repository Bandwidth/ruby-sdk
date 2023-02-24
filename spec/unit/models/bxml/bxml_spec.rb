require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Bxml
describe 'Bandwidth::Bxml::Bxml' do
  let(:instance) { Bandwidth::Bxml::Bxml.new }

  describe 'test an instance of Bxml' do
    it 'validates instance of Bxml' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Bxml)
    end

    it 'test the to_bxml method of the Bxml instance' do
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
