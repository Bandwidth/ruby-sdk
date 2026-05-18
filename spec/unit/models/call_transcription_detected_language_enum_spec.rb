# Unit tests for Bandwidth::CallTranscriptionDetectedLanguageEnum
describe Bandwidth::CallTranscriptionDetectedLanguageEnum do
  describe 'constants' do
    it 'defines EN_US' do
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum::EN_US).to eq('en-US')
    end

    it 'defines ES_US' do
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum::ES_US).to eq('es-US')
    end

    it 'defines FR_FR' do
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum::FR_FR).to eq('fr-FR')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum.all_vars).to eq([
        'en-US',
        'es-US',
        'fr-FR'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum.build_from_hash('en-US')).to eq('en-US')
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum.build_from_hash('es-US')).to eq('es-US')
      expect(Bandwidth::CallTranscriptionDetectedLanguageEnum.build_from_hash('fr-FR')).to eq('fr-FR')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallTranscriptionDetectedLanguageEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
