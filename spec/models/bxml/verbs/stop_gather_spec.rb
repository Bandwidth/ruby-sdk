require 'spec_helper'

# Unit tests for Bandwidth::Bxml::StopGather
describe 'Bandwidth::Bxml::StopGather' do
  let(:instance) { Bandwidth::Bxml::StopGather.new }

  describe 'test an instance of StopGather' do
    it 'validates instance of StopGather' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StopGather)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StopGather instance' do
      expected = "\n<StopGather/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
