# Unit tests for Bandwidth::ProductTypeEnum
describe Bandwidth::ProductTypeEnum do
  describe 'constants' do
    it 'defines LOCAL_A2_P' do
      expect(Bandwidth::ProductTypeEnum::LOCAL_A2_P).to eq('LOCAL_A2P')
    end

    it 'defines P2_P' do
      expect(Bandwidth::ProductTypeEnum::P2_P).to eq('P2P')
    end

    it 'defines SHORT_CODE_REACH' do
      expect(Bandwidth::ProductTypeEnum::SHORT_CODE_REACH).to eq('SHORT_CODE_REACH')
    end

    it 'defines TOLL_FREE' do
      expect(Bandwidth::ProductTypeEnum::TOLL_FREE).to eq('TOLL_FREE')
    end

    it 'defines HOSTED_SHORT_CODE' do
      expect(Bandwidth::ProductTypeEnum::HOSTED_SHORT_CODE).to eq('HOSTED_SHORT_CODE')
    end

    it 'defines ALPHA_NUMERIC' do
      expect(Bandwidth::ProductTypeEnum::ALPHA_NUMERIC).to eq('ALPHA_NUMERIC')
    end

    it 'defines RBM_MEDIA' do
      expect(Bandwidth::ProductTypeEnum::RBM_MEDIA).to eq('RBM_MEDIA')
    end

    it 'defines RBM_RICH' do
      expect(Bandwidth::ProductTypeEnum::RBM_RICH).to eq('RBM_RICH')
    end

    it 'defines RBM_CONVERSATIONAL' do
      expect(Bandwidth::ProductTypeEnum::RBM_CONVERSATIONAL).to eq('RBM_CONVERSATIONAL')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::ProductTypeEnum.all_vars).to eq([
        'LOCAL_A2P',
        'P2P',
        'SHORT_CODE_REACH',
        'TOLL_FREE',
        'HOSTED_SHORT_CODE',
        'ALPHA_NUMERIC',
        'RBM_MEDIA',
        'RBM_RICH',
        'RBM_CONVERSATIONAL'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::ProductTypeEnum.build_from_hash('LOCAL_A2P')).to eq('LOCAL_A2P')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('P2P')).to eq('P2P')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('SHORT_CODE_REACH')).to eq('SHORT_CODE_REACH')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('TOLL_FREE')).to eq('TOLL_FREE')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('HOSTED_SHORT_CODE')).to eq('HOSTED_SHORT_CODE')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('ALPHA_NUMERIC')).to eq('ALPHA_NUMERIC')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('RBM_MEDIA')).to eq('RBM_MEDIA')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('RBM_RICH')).to eq('RBM_RICH')
      expect(Bandwidth::ProductTypeEnum.build_from_hash('RBM_CONVERSATIONAL')).to eq('RBM_CONVERSATIONAL')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ProductTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
