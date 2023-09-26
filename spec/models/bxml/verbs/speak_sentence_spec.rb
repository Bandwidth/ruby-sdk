# Unit tests for Bandwidth::Bxml::SpeakSentence
describe 'Bandwidth::Bxml::SpeakSentence' do
  let(:initial_attributes) {
    {
      voice: 'julie',
      gender: 'female',
      locale: 'en_US'
    }
  }

  let(:new_attributes) {
    {
      voice: 'simon',
      gender: 'male',
      locale: 'en_UK'
    }
  }

  let(:instance) { Bandwidth::Bxml::SpeakSentence.new('<lang xml:lang="es-MX">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis>', initial_attributes) }

  describe 'test an instance of SpeakSentence' do
    it 'validates instance of SpeakSentence' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::SpeakSentence)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the SpeakSentence instance' do
      expected = "\n<SpeakSentence voice=\"julie\" gender=\"female\" locale=\"en_US\"><lang xml:lang=\"es-MX\">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis></SpeakSentence>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the SpeakSentence instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<SpeakSentence voice=\"simon\" gender=\"male\" locale=\"en_UK\"><lang xml:lang=\"es-MX\">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis></SpeakSentence>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end
end
