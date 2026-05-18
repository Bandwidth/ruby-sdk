# Unit tests for Bandwidth::PriorityEnum
describe Bandwidth::PriorityEnum do
  describe 'constants' do
    it 'defines DEFAULT' do
      expect(Bandwidth::PriorityEnum::DEFAULT).to eq('default')
    end

    it 'defines HIGH' do
      expect(Bandwidth::PriorityEnum::HIGH).to eq('high')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::PriorityEnum.all_vars).to eq([
        'default',
        'high'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::PriorityEnum.build_from_hash('default')).to eq('default')
      expect(Bandwidth::PriorityEnum.build_from_hash('high')).to eq('high')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::PriorityEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
