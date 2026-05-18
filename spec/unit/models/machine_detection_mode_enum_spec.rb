# Unit tests for Bandwidth::MachineDetectionModeEnum
describe Bandwidth::MachineDetectionModeEnum do
  describe 'constants' do
    it 'defines SYNC' do
      expect(Bandwidth::MachineDetectionModeEnum::SYNC).to eq('sync')
    end

    it 'defines ASYNC' do
      expect(Bandwidth::MachineDetectionModeEnum::ASYNC).to eq('async')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::MachineDetectionModeEnum.all_vars).to eq([
        'sync',
        'async'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::MachineDetectionModeEnum.build_from_hash('sync')).to eq('sync')
      expect(Bandwidth::MachineDetectionModeEnum.build_from_hash('async')).to eq('async')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MachineDetectionModeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
