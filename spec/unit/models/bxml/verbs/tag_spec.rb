require 'spec_helper'

# Unit tests for Bandwidth::Bxml::Tag
describe 'Bandwidth::Bxml::Tag' do
  let(:instance) { Bandwidth::Bxml::Tag.new('test_tag') }

  describe 'test an instance of Tag' do
    it 'validates instance of Tag' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Tag)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Tag instance' do
      expected = "\n<Tag>test_tag</Tag>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
