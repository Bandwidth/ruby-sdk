# Unit tests for Bandwidth::CallDirectionEnum
describe Bandwidth::CallDirectionEnum do
  describe 'constants' do
    it 'defines INBOUND' do
      expect(Bandwidth::CallDirectionEnum::INBOUND).to eq('inbound')
    end

    it 'defines OUTBOUND' do
      expect(Bandwidth::CallDirectionEnum::OUTBOUND).to eq('outbound')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::CallDirectionEnum.all_vars).to eq([
        'inbound',
        'outbound'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::CallDirectionEnum.build_from_hash('inbound')).to eq('inbound')
      expect(Bandwidth::CallDirectionEnum.build_from_hash('outbound')).to eq('outbound')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::CallDirectionEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
