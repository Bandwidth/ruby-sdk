# Unit tests for Bandwidth::MultiChannelAction
describe Bandwidth::MultiChannelAction do
  describe '.openapi_any_of' do
    it 'lists the classes defined in anyOf' do
      expect(Bandwidth::MultiChannelAction.openapi_any_of).to eq([
        :'MultiChannelActionCalendarEvent',
        :'RbmActionBase',
        :'RbmActionDial',
        :'RbmActionOpenUrl',
        :'RbmActionViewLocation'
      ])
    end
  end

  describe '.openapi_discriminator_name' do
    it 'returns the discriminator property name' do
      expect(Bandwidth::MultiChannelAction.openapi_discriminator_name).to eq(:'type')
    end
  end

  describe '.openapi_discriminator_mapping' do
    it 'maps every discriminator value to an anyOf class' do
      expect(Bandwidth::MultiChannelAction.openapi_discriminator_mapping).to eq({
        :'CREATE_CALENDAR_EVENT' => :'MultiChannelActionCalendarEvent',
        :'DIAL_PHONE' => :'RbmActionDial',
        :'OPEN_URL' => :'RbmActionOpenUrl',
        :'REPLY' => :'RbmActionBase',
        :'REQUEST_LOCATION' => :'RbmActionBase',
        :'SHOW_LOCATION' => :'RbmActionViewLocation'
      })
    end

    it 'maps only to classes listed in openapi_any_of' do
      mapping_targets = Bandwidth::MultiChannelAction.openapi_discriminator_mapping.values.uniq.sort
      expect(mapping_targets).to eq(Bandwidth::MultiChannelAction.openapi_any_of.sort)
    end
  end

  describe '.build' do
    it 'routes MultiChannelActionCalendarEvent discriminator values to MultiChannelActionCalendarEvent.build_from_hash' do
      Bandwidth::MultiChannelAction.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'MultiChannelActionCalendarEvent'
        data = { type: discriminator.to_s }
        expect(Bandwidth::MultiChannelActionCalendarEvent).to receive(:build_from_hash).with(data).and_return(:calendar_event_result)
        expect(Bandwidth::MultiChannelAction.build(data)).to eq(:calendar_event_result)
      end
    end

    it 'routes RbmActionBase discriminator values to RbmActionBase.build_from_hash' do
      Bandwidth::MultiChannelAction.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'RbmActionBase'
        data = { type: discriminator.to_s }
        expect(Bandwidth::RbmActionBase).to receive(:build_from_hash).with(data).and_return(:base_result)
        expect(Bandwidth::MultiChannelAction.build(data)).to eq(:base_result)
      end
    end

    it 'routes RbmActionDial discriminator values to RbmActionDial.build_from_hash' do
      Bandwidth::MultiChannelAction.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'RbmActionDial'
        data = { type: discriminator.to_s }
        expect(Bandwidth::RbmActionDial).to receive(:build_from_hash).with(data).and_return(:dial_result)
        expect(Bandwidth::MultiChannelAction.build(data)).to eq(:dial_result)
      end
    end

    it 'routes RbmActionOpenUrl discriminator values to RbmActionOpenUrl.build_from_hash' do
      Bandwidth::MultiChannelAction.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'RbmActionOpenUrl'
        data = { type: discriminator.to_s }
        expect(Bandwidth::RbmActionOpenUrl).to receive(:build_from_hash).with(data).and_return(:open_url_result)
        expect(Bandwidth::MultiChannelAction.build(data)).to eq(:open_url_result)
      end
    end

    it 'routes RbmActionViewLocation discriminator values to RbmActionViewLocation.build_from_hash' do
      Bandwidth::MultiChannelAction.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'RbmActionViewLocation'
        data = { type: discriminator.to_s }
        expect(Bandwidth::RbmActionViewLocation).to receive(:build_from_hash).with(data).and_return(:view_location_result)
        expect(Bandwidth::MultiChannelAction.build(data)).to eq(:view_location_result)
      end
    end

    it 'returns nil when the discriminator value is missing' do
      expect(Bandwidth::MultiChannelAction.build({})).to be_nil
    end

    it 'returns nil when the discriminator value does not match any mapping' do
      expect(Bandwidth::MultiChannelAction.build({ type: 'unknown' })).to be_nil
    end
  end
end
