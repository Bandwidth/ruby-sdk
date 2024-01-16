# Unit tests for Bandwidth::Bxml::Bxml
describe 'Bandwidth::Bxml::Bxml' do
  let(:instance) { Bandwidth::Bxml::Bxml.new }
  let(:pause_recording) { Bandwidth::Bxml::PauseRecording.new }

  describe 'test an instance of Bxml' do
    it 'validates instance of Bxml' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Bxml)
      expect(instance).to be_a(Bandwidth::Bxml::Root)
    end

    it 'test initializing with a single nested verb' do
      instance = Bandwidth::Bxml::Bxml.new(pause_recording)
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml>\n  <PauseRecording/>\n</Bxml>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test initializing with multiple nested verbs' do
      instance = Bandwidth::Bxml::Bxml.new([pause_recording, pause_recording])
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml>\n  <PauseRecording/>\n  <PauseRecording/>\n</Bxml>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test adding a single verb to the Bxml instance' do
      instance.add_verbs(pause_recording)
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml>\n  <PauseRecording/>\n</Bxml>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test adding multiple verbs to the Bxml instance' do
      instance.add_verbs([pause_recording, pause_recording])
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml>\n  <PauseRecording/>\n  <PauseRecording/>\n</Bxml>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test the to_bxml method of the Bxml instance' do
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Bxml/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
