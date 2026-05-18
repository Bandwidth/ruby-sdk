# Unit tests for Bandwidth::DeactivationEventEnum
describe Bandwidth::DeactivationEventEnum do
  describe 'constants' do
    it 'defines DEACTIVATED' do
      expect(Bandwidth::DeactivationEventEnum::DEACTIVATED).to eq('DEACTIVATED')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::DeactivationEventEnum.all_vars).to eq([
        'DEACTIVATED'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::DeactivationEventEnum.build_from_hash('DEACTIVATED')).to eq('DEACTIVATED')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::DeactivationEventEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
