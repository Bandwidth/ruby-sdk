# Unit tests for Bandwidth::MultiChannelMessageChannelEnum
describe Bandwidth::MultiChannelMessageChannelEnum do
  describe 'constants' do
    it 'defines RBM' do
      expect(Bandwidth::MultiChannelMessageChannelEnum::RBM).to eq('RBM')
    end

    it 'defines SMS' do
      expect(Bandwidth::MultiChannelMessageChannelEnum::SMS).to eq('SMS')
    end

    it 'defines MMS' do
      expect(Bandwidth::MultiChannelMessageChannelEnum::MMS).to eq('MMS')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::MultiChannelMessageChannelEnum.all_vars).to eq([
        'RBM',
        'SMS',
        'MMS'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::MultiChannelMessageChannelEnum.build_from_hash('RBM')).to eq('RBM')
      expect(Bandwidth::MultiChannelMessageChannelEnum.build_from_hash('SMS')).to eq('SMS')
      expect(Bandwidth::MultiChannelMessageChannelEnum.build_from_hash('MMS')).to eq('MMS')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MultiChannelMessageChannelEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
