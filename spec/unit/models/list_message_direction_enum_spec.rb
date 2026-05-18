# Unit tests for Bandwidth::ListMessageDirectionEnum
describe Bandwidth::ListMessageDirectionEnum do
  describe 'constants' do
    it 'defines INBOUND' do
      expect(Bandwidth::ListMessageDirectionEnum::INBOUND).to eq('INBOUND')
    end

    it 'defines OUTBOUND' do
      expect(Bandwidth::ListMessageDirectionEnum::OUTBOUND).to eq('OUTBOUND')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::ListMessageDirectionEnum.all_vars).to eq([
        'INBOUND',
        'OUTBOUND'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::ListMessageDirectionEnum.build_from_hash('INBOUND')).to eq('INBOUND')
      expect(Bandwidth::ListMessageDirectionEnum.build_from_hash('OUTBOUND')).to eq('OUTBOUND')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ListMessageDirectionEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
