# Unit tests for Bandwidth::FileFormatEnum
describe Bandwidth::FileFormatEnum do
  describe 'constants' do
    it 'defines MP3' do
      expect(Bandwidth::FileFormatEnum::MP3).to eq('mp3')
    end

    it 'defines WAV' do
      expect(Bandwidth::FileFormatEnum::WAV).to eq('wav')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::FileFormatEnum.all_vars).to eq([
        'mp3',
        'wav'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::FileFormatEnum.build_from_hash('mp3')).to eq('mp3')
      expect(Bandwidth::FileFormatEnum.build_from_hash('wav')).to eq('wav')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::FileFormatEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
