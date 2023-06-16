

# Unit tests for Bandwidth::Bxml::PlayAudio
describe 'Bandwidth::Bxml::PlayAudio' do
  let(:initial_attributes) {
    {
      username: 'initial_username',
      password: 'initial_password'
    }
  }

  let(:new_attributes) {
    {
      username: 'new_username',
      password: 'new_password'
    }
  }

  let(:instance) { Bandwidth::Bxml::PlayAudio.new('https://audio.url/audio1.wav', initial_attributes) }

  describe 'test an instance of PlayAudio' do
    it 'validates instance of PlayAudio' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::PlayAudio)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the PlayAudio instance' do
      expected = "\n<PlayAudio username=\"initial_username\" password=\"initial_password\">https://audio.url/audio1.wav</PlayAudio>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the PlayAudio instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<PlayAudio username=\"new_username\" password=\"new_password\">https://audio.url/audio1.wav</PlayAudio>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
