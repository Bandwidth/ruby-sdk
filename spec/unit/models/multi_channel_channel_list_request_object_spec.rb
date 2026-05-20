# Unit tests for Bandwidth::MultiChannelChannelListRequestObject
describe Bandwidth::MultiChannelChannelListRequestObject do
  describe '.openapi_any_of' do
    it 'lists the classes defined in anyOf' do
      expect(Bandwidth::MultiChannelChannelListRequestObject.openapi_any_of).to eq([
        :'MultiChannelChannelListMMSObject',
        :'MultiChannelChannelListRBMObject',
        :'MultiChannelChannelListSMSObject'
      ])
    end
  end

  describe '.openapi_discriminator_name' do
    it 'returns the discriminator property name' do
      expect(Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_name).to eq(:'channel')
    end
  end

  describe '.openapi_discriminator_mapping' do
    it 'maps every discriminator value to an anyOf class' do
      expect(Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_mapping).to eq({
        :'MMS' => :'MultiChannelChannelListMMSObject',
        :'RBM' => :'MultiChannelChannelListRBMObject',
        :'SMS' => :'MultiChannelChannelListSMSObject'
      })
    end

    it 'maps only to classes listed in openapi_any_of' do
      mapping_targets = Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_mapping.values.uniq.sort
      expect(mapping_targets).to eq(Bandwidth::MultiChannelChannelListRequestObject.openapi_any_of.sort)
    end
  end

  describe '.build' do
    it 'routes MultiChannelChannelListMMSObject discriminator values to MultiChannelChannelListMMSObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListMMSObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListMMSObject).to receive(:build_from_hash).with(data).and_return(:mms_result)
        expect(Bandwidth::MultiChannelChannelListRequestObject.build(data)).to eq(:mms_result)
      end
    end

    it 'routes MultiChannelChannelListRBMObject discriminator values to MultiChannelChannelListRBMObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListRBMObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListRBMObject).to receive(:build_from_hash).with(data).and_return(:rbm_result)
        expect(Bandwidth::MultiChannelChannelListRequestObject.build(data)).to eq(:rbm_result)
      end
    end

    it 'routes MultiChannelChannelListSMSObject discriminator values to MultiChannelChannelListSMSObject.build_from_hash' do
      Bandwidth::MultiChannelChannelListRequestObject.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelChannelListSMSObject'
        data = { channel: discriminator.to_s }
        expect(Bandwidth::MultiChannelChannelListSMSObject).to receive(:build_from_hash).with(data).and_return(:sms_result)
        expect(Bandwidth::MultiChannelChannelListRequestObject.build(data)).to eq(:sms_result)
      end
    end

    it 'returns nil when the discriminator value is missing' do
      expect(Bandwidth::MultiChannelChannelListRequestObject.build({})).to be_nil
    end

    it 'returns nil when the discriminator value does not match any mapping' do
      expect(Bandwidth::MultiChannelChannelListRequestObject.build({ channel: 'unknown' })).to be_nil
    end
  end
end
