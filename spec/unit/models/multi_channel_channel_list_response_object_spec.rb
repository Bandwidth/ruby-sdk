# Unit tests for Bandwidth::MultiChannelChannelListResponseObject
describe Bandwidth::MultiChannelChannelListResponseObject do
  describe '.openapi_any_of' do
    it 'lists the classes defined in anyOf' do
      expect(Bandwidth::MultiChannelChannelListResponseObject.openapi_any_of).to eq([
        :'MultiChannelChannelListMMSResponseObject',
        :'MultiChannelChannelListRBMResponseObject',
        :'MultiChannelChannelListSMSResponseObject'
      ])
    end
  end

  describe '.openapi_discriminator_name' do
    it 'returns the discriminator property name' do
      expect(Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_name).to eq(:'channel')
    end
  end

  describe '.openapi_discriminator_mapping' do
    it 'maps every discriminator value to an anyOf class' do
      expect(Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_mapping).to eq({
        :'MMS' => :'MultiChannelChannelListMMSResponseObject',
        :'RBM' => :'MultiChannelChannelListRBMResponseObject',
        :'SMS' => :'MultiChannelChannelListSMSResponseObject'
      })
    end

    it 'maps only to classes listed in openapi_any_of' do
      mapping_targets = Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_mapping.values.uniq.sort
      expect(mapping_targets).to eq(Bandwidth::MultiChannelChannelListResponseObject.openapi_any_of.sort)
    end
  end

  describe '.build' do
    it 'routes MultiChannelChannelListMMSResponseObject discriminator values to MultiChannelChannelListMMSResponseObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListMMSResponseObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListMMSResponseObject).to receive(:build_from_hash).with(data).and_return(:mms_result)
        expect(Bandwidth::MultiChannelChannelListResponseObject.build(data)).to eq(:mms_result)
      end
    end

    it 'routes MultiChannelChannelListRBMResponseObject discriminator values to MultiChannelChannelListRBMResponseObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListRBMResponseObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListRBMResponseObject).to receive(:build_from_hash).with(data).and_return(:rbm_result)
        expect(Bandwidth::MultiChannelChannelListResponseObject.build(data)).to eq(:rbm_result)
      end
    end

    it 'routes MultiChannelChannelListSMSResponseObject discriminator values to MultiChannelChannelListSMSResponseObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListResponseObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListSMSResponseObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListSMSResponseObject).to receive(:build_from_hash).with(data).and_return(:sms_result)
        expect(Bandwidth::MultiChannelChannelListResponseObject.build(data)).to eq(:sms_result)
      end
    end

    it 'returns nil when the discriminator value is missing' do
      expect(Bandwidth::MultiChannelChannelListResponseObject.build({})).to be_nil
    end

    it 'returns nil when the discriminator value does not match any mapping' do
      expect(Bandwidth::MultiChannelChannelListResponseObject.build({ channel: 'unknown' })).to be_nil
    end
  end
end
