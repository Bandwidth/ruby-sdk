# Unit tests for Bandwidth::Bxml::Gather
describe 'Bandwidth::Bxml::Gather' do
  let(:initial_attributes) {
    {
      gather_url: 'https://initial.com',
      gather_method: 'POST',
      gather_fallback_url: 'https://initial.com',
      gather_fallback_method: 'POST',
      username: 'initial_username',
      password: 'initial_password',
      fallback_username: 'initial_fallback_username',
      fallback_password: 'initial_fallback_password',
      tag: 'initial_tag',
      terminating_digits: '5',
      max_digits: 5,
      inter_digit_timeout: 5,
      first_digit_timeout: 5,
      repeat_count: 5
    }
  }

  let(:new_attributes) {
    {
      gather_url: 'https://new.com',
      gather_method: 'POST',
      gather_fallback_url: 'https://new.com',
      gather_fallback_method: 'GET',
      username: 'new_username',
      password: 'new_password',
      fallback_username: 'new_fallback_username',
      fallback_password: 'new_fallback_password',
      tag: 'new_tag',
      terminating_digits: '10',
      max_digits: 10,
      inter_digit_timeout: 10,
      first_digit_timeout: 10,
      repeat_count: 10
    }
  }

  let (:play_audio) { Bandwidth::Bxml::PlayAudio.new('https://audio.url/audio1.wav') }
  let (:speak_sentence) { Bandwidth::Bxml::SpeakSentence.new('<lang xml:lang="es-MX">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis>') }

  let(:instance) { Bandwidth::Bxml::Gather.new([], initial_attributes) }
  let(:instance_nested) { Bandwidth::Bxml::Gather.new([play_audio], initial_attributes) }

  describe 'test an instance of Gather' do
    it 'validates instance of Gather' do
      expect(instance).to be_instance_of(Bandwidth::Bxml::Gather)
      expect(instance).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the Gather instance' do
      expected = "\n<Gather gatherUrl=\"https://initial.com\" gatherMethod=\"POST\" gatherFallbackUrl=\"https://initial.com\" gatherFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" terminatingDigits=\"5\" maxDigits=\"5\" interDigitTimeout=\"5\" firstDigitTimeout=\"5\" repeat_count=\"5\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end

    it 'tests the set_attributes method of the Gather instance' do
      instance.set_attributes(new_attributes)
      expected = "\n<Gather gatherUrl=\"https://new.com\" gatherMethod=\"POST\" gatherFallbackUrl=\"https://new.com\" gatherFallbackMethod=\"GET\" username=\"new_username\" password=\"new_password\" fallbackUsername=\"new_fallback_username\" fallbackPassword=\"new_fallback_password\" tag=\"new_tag\" terminatingDigits=\"10\" maxDigits=\"10\" interDigitTimeout=\"10\" firstDigitTimeout=\"10\" repeat_count=\"10\"/>\n"
      expect(instance.to_bxml).to eq(expected)
    end
  end

  describe 'test an instance of Gather with nested verbs' do
    it 'validates instance of Gather' do
      expect(instance_nested).to be_instance_of(Bandwidth::Bxml::Gather)
      expect(instance_nested).to be_a(Bandwidth::Bxml::Verb)
    end

    it 'tests the to_bxml method of the nested Gather instance' do
      expected = "\n<Gather gatherUrl=\"https://initial.com\" gatherMethod=\"POST\" gatherFallbackUrl=\"https://initial.com\" gatherFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" terminatingDigits=\"5\" maxDigits=\"5\" interDigitTimeout=\"5\" firstDigitTimeout=\"5\" repeat_count=\"5\">\n  <PlayAudio>https://audio.url/audio1.wav</PlayAudio>\n</Gather>\n"
      expect(instance_nested.to_bxml).to eq(expected)
    end

    it 'tests the add_verb method of the nested Gather instance' do
      expected_single = "\n<Gather gatherUrl=\"https://initial.com\" gatherMethod=\"POST\" gatherFallbackUrl=\"https://initial.com\" gatherFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" terminatingDigits=\"5\" maxDigits=\"5\" interDigitTimeout=\"5\" firstDigitTimeout=\"5\" repeat_count=\"5\">\n  <PlayAudio>https://audio.url/audio1.wav</PlayAudio>\n  <SpeakSentence><lang xml:lang=\"es-MX\">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis></SpeakSentence>\n</Gather>\n"
      instance_nested.add_audio_verb(speak_sentence)
      expect(instance_nested.to_bxml).to eq(expected_single)

      expected_multiple = "\n<Gather gatherUrl=\"https://initial.com\" gatherMethod=\"POST\" gatherFallbackUrl=\"https://initial.com\" gatherFallbackMethod=\"POST\" username=\"initial_username\" password=\"initial_password\" fallbackUsername=\"initial_fallback_username\" fallbackPassword=\"initial_fallback_password\" tag=\"initial_tag\" terminatingDigits=\"5\" maxDigits=\"5\" interDigitTimeout=\"5\" firstDigitTimeout=\"5\" repeat_count=\"5\">\n  <PlayAudio>https://audio.url/audio1.wav</PlayAudio>\n  <SpeakSentence><lang xml:lang=\"es-MX\">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis></SpeakSentence>\n  <SpeakSentence><lang xml:lang=\"es-MX\">Hola</lang>ruby speak sentence <emphasis>SSML test</emphasis></SpeakSentence>\n  <PlayAudio>https://audio.url/audio1.wav</PlayAudio>\n</Gather>\n"
      instance_nested.add_audio_verb([speak_sentence, play_audio])
      expect(instance_nested.to_bxml).to eq(expected_multiple)
    end
  end
end
