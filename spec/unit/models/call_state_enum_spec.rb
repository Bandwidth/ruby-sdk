# Unit tests for Bandwidth::CallStateEnum
describe Bandwidth::CallStateEnum do
  describe 'constants' do
    it 'defines ACTIVE' do
      expect(Bandwidth::CallStateEnum::ACTIVE).to eq('active')
    end

    it 'defines COMPLETED' do
      expect(Bandwidth::CallStateEnum::COMPLETED).to eq('completed')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CallStateEnum.all_vars).to eq(['active', 'completed'])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CallStateEnum.build_from_hash('active')).to eq('active')
      expect(Bandwidth::CallStateEnum.build_from_hash('completed')).to eq('completed')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallStateEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
