# Unit tests for Bandwidth::StandaloneCardOrientationEnum
describe Bandwidth::StandaloneCardOrientationEnum do
  describe 'constants' do
    it 'defines HORIZONTAL' do
      expect(Bandwidth::StandaloneCardOrientationEnum::HORIZONTAL).to eq('HORIZONTAL')
    end

    it 'defines VERTICAL' do
      expect(Bandwidth::StandaloneCardOrientationEnum::VERTICAL).to eq('VERTICAL')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::StandaloneCardOrientationEnum.all_vars).to eq([
        'HORIZONTAL',
        'VERTICAL'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::StandaloneCardOrientationEnum.build_from_hash('HORIZONTAL')).to eq('HORIZONTAL')
      expect(Bandwidth::StandaloneCardOrientationEnum.build_from_hash('VERTICAL')).to eq('VERTICAL')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::StandaloneCardOrientationEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
