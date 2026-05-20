# Unit tests for Bandwidth::ThumbnailAlignmentEnum
describe Bandwidth::ThumbnailAlignmentEnum do
  describe 'constants' do
    it 'defines LEFT' do
      expect(Bandwidth::ThumbnailAlignmentEnum::LEFT).to eq('LEFT')
    end

    it 'defines RIGHT' do
      expect(Bandwidth::ThumbnailAlignmentEnum::RIGHT).to eq('RIGHT')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::ThumbnailAlignmentEnum.all_vars).to eq([
        'LEFT',
        'RIGHT'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::ThumbnailAlignmentEnum.build_from_hash('LEFT')).to eq('LEFT')
      expect(Bandwidth::ThumbnailAlignmentEnum.build_from_hash('RIGHT')).to eq('RIGHT')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ThumbnailAlignmentEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
