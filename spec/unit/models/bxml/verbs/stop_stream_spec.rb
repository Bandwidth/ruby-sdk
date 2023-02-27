require 'spec_helper'

# Unit tests for Bandwidth::Bxml::StopStream
describe 'Bandwidth::Bxml::StopStream' do
  let(:initial_attributes) {
    {
      name: 'initial'
    }
  }

  let(:new_attributes) {
    {
      name: 'new'
    }
  }

  let(:instance) { Bandwidth::Bxml::StopStream.new(initial_attributes) }

  describe 'test an instance of StopStream' do
    it 'validates instance of StopStream' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StopStream)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StopStream instance' do
      expected = "\n<StopStream name=\"initial\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the StopStream instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<StopStream name=\"new\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
