# Unit tests for Bandwidth::Bxml::Response
describe 'Bandwidth::Bxml::Response' do
  let(:instance) { Bandwidth::Bxml::Response.new }
  let(:pause_recording) { Bandwidth::Bxml::PauseRecording.new }

  describe 'test an instance of Response' do
    it 'validates instance of Response' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Response)
      expect(instance).to be_a(Bandwidth::Bxml::Root)
    end

    it 'test initializing with a single nested verb' do
      instance = Bandwidth::Bxml::Response.new(pause_recording)
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  <PauseRecording/>\n</Response>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test initializing with multiple nested verbs' do
      instance = Bandwidth::Bxml::Response.new([pause_recording, pause_recording])
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  <PauseRecording/>\n  <PauseRecording/>\n</Response>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test adding a single verb to the Response instance' do
      instance.add_verbs(pause_recording)
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  <PauseRecording/>\n</Response>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test adding multiple verbs to the Response instance' do
      instance.add_verbs([pause_recording, pause_recording])
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n  <PauseRecording/>\n  <PauseRecording/>\n</Response>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'test the to_bxml method of the Response instance' do
      expected = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
