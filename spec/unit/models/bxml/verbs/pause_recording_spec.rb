require 'spec_helper'

# Unit tests for Bandwidth::Bxml::PauseRecording
describe 'Bandwidth::Bxml::PauseRecording' do
  let(:instance) { Bandwidth::Bxml::PauseRecording.new }

  describe 'test an instance of PauseRecording' do
    it 'validates instance of PauseRecording' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::PauseRecording)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the PauseRecording instance' do
      expected = "\n<PauseRecording/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
