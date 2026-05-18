# Unit tests for Bandwidth::Callback
describe Bandwidth::Callback do
  describe '.openapi_one_of' do
    it 'lists the classes defined in oneOf' do
      expect(Bandwidth::Callback.openapi_one_of).to eq([
        :'InboundCallback',
        :'StatusCallback'
      ])
    end
  end

  describe '.openapi_discriminator_name' do
    it 'returns the discriminator property name' do
      expect(Bandwidth::Callback.openapi_discriminator_name).to eq(:'type')
    end
  end

  describe '.openapi_discriminator_mapping' do
    it 'maps every discriminator value to a oneOf class' do
      expect(Bandwidth::Callback.openapi_discriminator_mapping).to eq({
        :'message-delivered' => :'StatusCallback',
        :'message-failed' => :'StatusCallback',
        :'message-read' => :'StatusCallback',
        :'message-received' => :'InboundCallback',
        :'message-sending' => :'StatusCallback',
        :'message-sent' => :'StatusCallback',
        :'request-location-response' => :'InboundCallback',
        :'suggestion-response' => :'InboundCallback'
      })
    end

    it 'maps only to classes listed in openapi_one_of' do
      mapping_targets = Bandwidth::Callback.openapi_discriminator_mapping.values.uniq.sort
      expect(mapping_targets).to eq(Bandwidth::Callback.openapi_one_of.sort)
    end
  end

  describe '.build' do
    it 'routes inbound discriminator values to InboundCallback.build_from_hash' do
      Bandwidth::Callback.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'InboundCallback'
        data = { type: discriminator.to_s }
        expect(Bandwidth::InboundCallback).to receive(:build_from_hash).with(data).and_return(:inbound_result)
        expect(Bandwidth::Callback.build(data)).to eq(:inbound_result)
      end
    end

    it 'routes status discriminator values to StatusCallback.build_from_hash' do
      Bandwidth::Callback.openapi_discriminator_mapping.each do |discriminator, klass|
        next unless klass == :'StatusCallback'
        data = { type: discriminator.to_s }
        expect(Bandwidth::StatusCallback).to receive(:build_from_hash).with(data).and_return(:status_result)
        expect(Bandwidth::Callback.build(data)).to eq(:status_result)
      end
    end

    it 'returns nil when the discriminator value is missing' do
      expect(Bandwidth::Callback.build({})).to be_nil
    end

    it 'returns nil when the discriminator value does not match any mapping' do
      expect(Bandwidth::Callback.build({ type: 'unknown' })).to be_nil
    end
  end
end
