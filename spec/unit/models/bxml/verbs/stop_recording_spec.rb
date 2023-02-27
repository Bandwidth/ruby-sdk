require 'spec_helper'

# Unit tests for Bandwidth::Bxml::StopRecording
describe 'Bandwidth::Bxml::StopRecording' do
  let(:instance) { Bandwidth::Bxml::StopRecording.new }

  describe 'test an instance of StopRecording' do
    it 'validates instance of StopRecording' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::StopRecording)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the StopRecording instance' do
      expected = "\n<StopRecording/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
