require 'spec_helper'

# Unit tests for Bandwidth::Bxml::ResumeRecording
describe 'Bandwidth::Bxml::ResumeRecording' do
  let(:instance) { Bandwidth::Bxml::ResumeRecording.new }

  describe 'test an instance of ResumeRecording' do
    it 'validates instance of ResumeRecording' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::ResumeRecording)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the ResumeRecording instance' do
      expected = "\n<ResumeRecording/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
