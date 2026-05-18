# Unit tests for Bandwidth::MessageDirectionEnum
describe Bandwidth::MessageDirectionEnum do
  describe 'constants' do
    it 'defines IN' do
      expect(Bandwidth::MessageDirectionEnum::IN).to eq('in')
    end

    it 'defines OUT' do
      expect(Bandwidth::MessageDirectionEnum::OUT).to eq('out')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::MessageDirectionEnum.all_vars).to eq([
        'in',
        'out'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::MessageDirectionEnum.build_from_hash('in')).to eq('in')
      expect(Bandwidth::MessageDirectionEnum.build_from_hash('out')).to eq('out')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageDirectionEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
