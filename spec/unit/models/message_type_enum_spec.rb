# Unit tests for Bandwidth::MessageTypeEnum
describe Bandwidth::MessageTypeEnum do
  describe 'constants' do
    it 'defines SMS' do
      expect(Bandwidth::MessageTypeEnum::SMS).to eq('sms')
    end

    it 'defines MMS' do
      expect(Bandwidth::MessageTypeEnum::MMS).to eq('mms')
    end

    it 'defines RCS' do
      expect(Bandwidth::MessageTypeEnum::RCS).to eq('rcs')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::MessageTypeEnum.all_vars).to eq([
        'sms',
        'mms',
        'rcs'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::MessageTypeEnum.build_from_hash('sms')).to eq('sms')
      expect(Bandwidth::MessageTypeEnum.build_from_hash('mms')).to eq('mms')
      expect(Bandwidth::MessageTypeEnum.build_from_hash('rcs')).to eq('rcs')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::MessageTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
