# Unit tests for Bandwidth::RbmActionTypeEnum
describe Bandwidth::RbmActionTypeEnum do
  describe 'constants' do
    it 'defines REPLY' do
      expect(Bandwidth::RbmActionTypeEnum::REPLY).to eq('REPLY')
    end

    it 'defines DIAL_PHONE' do
      expect(Bandwidth::RbmActionTypeEnum::DIAL_PHONE).to eq('DIAL_PHONE')
    end

    it 'defines SHOW_LOCATION' do
      expect(Bandwidth::RbmActionTypeEnum::SHOW_LOCATION).to eq('SHOW_LOCATION')
    end

    it 'defines CREATE_CALENDAR_EVENT' do
      expect(Bandwidth::RbmActionTypeEnum::CREATE_CALENDAR_EVENT).to eq('CREATE_CALENDAR_EVENT')
    end

    it 'defines OPEN_URL' do
      expect(Bandwidth::RbmActionTypeEnum::OPEN_URL).to eq('OPEN_URL')
    end

    it 'defines REQUEST_LOCATION' do
      expect(Bandwidth::RbmActionTypeEnum::REQUEST_LOCATION).to eq('REQUEST_LOCATION')
    end
  end

  describe '.all_vars' do
    it 'returns every valid enum value' do
      expect(Bandwidth::RbmActionTypeEnum.all_vars).to eq([
        'REPLY',
        'DIAL_PHONE',
        'SHOW_LOCATION',
        'CREATE_CALENDAR_EVENT',
        'OPEN_URL',
        'REQUEST_LOCATION'
      ])
    end
  end

  describe '.build_from_hash' do
    it 'returns the value when it matches a valid enum value' do
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('REPLY')).to eq('REPLY')
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('DIAL_PHONE')).to eq('DIAL_PHONE')
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('SHOW_LOCATION')).to eq('SHOW_LOCATION')
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('CREATE_CALENDAR_EVENT')).to eq('CREATE_CALENDAR_EVENT')
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('OPEN_URL')).to eq('OPEN_URL')
      expect(Bandwidth::RbmActionTypeEnum.build_from_hash('REQUEST_LOCATION')).to eq('REQUEST_LOCATION')
    end

    it 'raises an error for an invalid enum value' do
      expect {
        Bandwidth::RbmActionTypeEnum.build_from_hash('invalid')
      }.to raise_error(RuntimeError)
    end
  end
end
