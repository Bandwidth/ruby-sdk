# Unit tests for Bandwidth::ReferCallStatusEnum
describe Bandwidth::ReferCallStatusEnum do
  describe 'constants' do
    it 'defines SUCCESS' do
      expect(Bandwidth::ReferCallStatusEnum::SUCCESS).to eq('success')
    end

    it 'defines FAILURE' do
      expect(Bandwidth::ReferCallStatusEnum::FAILURE).to eq('failure')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::ReferCallStatusEnum.all_vars).to eq([
        'success',
        'failure'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::ReferCallStatusEnum.build_from_hash('success')).to eq('success')
      expect(Bandwidth::ReferCallStatusEnum.build_from_hash('failure')).to eq('failure')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::ReferCallStatusEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
