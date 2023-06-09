require 'spec_helper'

# Unit tests for Bandwidth::Bxml::CustomParam
describe 'Bandwidth::Bxml::CustomParam' do
  let(:initial_attributes) {
    {
      name: 'initial_name',
      value: 'initial_value'
    }
  }

  let(:new_attributes) {
    {
      name: 'new_name',
      value: 'new_value'
    }
  }

  let(:instance) { Bandwidth::Bxml::CustomParam.new(initial_attributes) }

  describe 'test an instance of CustomParam' do
    it 'validates instance of CustomParam' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::CustomParam)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the CustomParam instance' do
      expected = "\n<CustomParam name=\"initial_name\" value=\"initial_value\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the CustomParam instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<CustomParam name=\"new_name\" value=\"new_value\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
