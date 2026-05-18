# Unit tests for Bandwidth::LineTypeEnum
describe Bandwidth::LineTypeEnum do
  describe 'constants' do
    it 'defines FIXED' do
      expect(Bandwidth::LineTypeEnum::FIXED).to eq('FIXED')
    end

    it 'defines VOIP_FIXED' do
      expect(Bandwidth::LineTypeEnum::VOIP_FIXED).to eq('VOIP-FIXED')
    end

    it 'defines MOBILE' do
      expect(Bandwidth::LineTypeEnum::MOBILE).to eq('MOBILE')
    end

    it 'defines VOIP' do
      expect(Bandwidth::LineTypeEnum::VOIP).to eq('VOIP')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::LineTypeEnum.all_vars).to eq([
        'FIXED',
        'VOIP-FIXED',
        'MOBILE',
        'VOIP'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::LineTypeEnum.build_from_hash('FIXED')).to eq('FIXED')
      expect(Bandwidth::LineTypeEnum.build_from_hash('VOIP-FIXED')).to eq('VOIP-FIXED')
      expect(Bandwidth::LineTypeEnum.build_from_hash('MOBILE')).to eq('MOBILE')
      expect(Bandwidth::LineTypeEnum.build_from_hash('VOIP')).to eq('VOIP')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::LineTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
