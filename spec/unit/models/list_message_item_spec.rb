# Unit tests for Bandwidth::ListMessageItem
describe Bandwidth::ListMessageItem do
  let(:list_message_item_default) { Bandwidth::ListMessageItem.new }
  let(:list_message_item_values) { Bandwidth::ListMessageItem.new({
    message_id: '1589228074636lm4k2je7j7jklbn2',
    account_id: '9900000',
    source_tn: '+19195554321',
    destination_tn: '+19195551234',
    message_status: Bandwidth::MessageStatusEnum::DELIVERED,
    message_direction: Bandwidth::ListMessageDirectionEnum::OUTBOUND,
    message_type: Bandwidth::MessageTypeEnum::SMS,
    segment_count: 1,
    error_code: 0,
    receive_time: '2022-06-16T13:15:07.160Z',
    carrier_name: 'verizon',
    message_size: 27,
    message_length: 18,
    attachment_count: 0,
    recipient_count: 1,
    campaign_class: 'T',
    campaign_id: 'CABC123',
    bw_latency: 1,
    carrier_latency: 2,
    calling_number_country_a3: 'USA',
    called_number_country_a3: 'USA',
    product: 'MESSAGING-V2',
    location: 'loc-1'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::ListMessageItem.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::ListMessageItem.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::ListMessageItem.acceptable_attributes).to eq(Bandwidth::ListMessageItem.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::ListMessageItem.openapi_nullable).to eq(Set.new([
        :'carrier_name',
        :'message_size',
        :'attachment_count',
        :'recipient_count',
        :'campaign_class',
        :'campaign_id',
        :'bw_latency',
        :'carrier_latency',
        :'calling_number_country_a3',
        :'called_number_country_a3',
        :'product',
        :'location'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of ListMessageItem created by the build_from_hash method' do
      list_message_item_from_hash = Bandwidth::ListMessageItem.build_from_hash({
        messageId: '1589228074636lm4k2je7j7jklbn2',
        accountId: '9900000',
        sourceTn: '+19195554321',
        destinationTn: '+19195551234',
        messageStatus: 'DELIVERED',
        messageDirection: 'OUTBOUND',
        messageType: 'sms',
        segmentCount: 1,
        errorCode: 0,
        receiveTime: '2022-06-16T13:15:07.160Z',
        carrierName: 'verizon',
        messageSize: 27,
        messageLength: 18,
        attachmentCount: 0,
        recipientCount: 1,
        campaignClass: 'T',
        campaignId: 'CABC123',
        bwLatency: 1,
        carrierLatency: 2,
        callingNumberCountryA3: 'USA',
        calledNumberCountryA3: 'USA',
        product: 'MESSAGING-V2',
        location: 'loc-1'
      })
      expect(list_message_item_from_hash).to be_instance_of(Bandwidth::ListMessageItem)
      expect(list_message_item_from_hash.message_id).to eq('1589228074636lm4k2je7j7jklbn2')
      expect(list_message_item_from_hash.account_id).to eq('9900000')
      expect(list_message_item_from_hash.source_tn).to eq('+19195554321')
      expect(list_message_item_from_hash.destination_tn).to eq('+19195551234')
      expect(list_message_item_from_hash.message_status).to eq('DELIVERED')
      expect(list_message_item_from_hash.message_direction).to eq('OUTBOUND')
      expect(list_message_item_from_hash.message_type).to eq('sms')
      expect(list_message_item_from_hash.segment_count).to eq(1)
      expect(list_message_item_from_hash.error_code).to eq(0)
      expect(list_message_item_from_hash.receive_time).to eq(Time.parse('2022-06-16T13:15:07.160Z'))
      expect(list_message_item_from_hash.carrier_name).to eq('verizon')
      expect(list_message_item_from_hash.message_size).to eq(27)
      expect(list_message_item_from_hash.message_length).to eq(18)
      expect(list_message_item_from_hash.attachment_count).to eq(0)
      expect(list_message_item_from_hash.recipient_count).to eq(1)
      expect(list_message_item_from_hash.campaign_class).to eq('T')
      expect(list_message_item_from_hash.campaign_id).to eq('CABC123')
      expect(list_message_item_from_hash.bw_latency).to eq(1)
      expect(list_message_item_from_hash.carrier_latency).to eq(2)
      expect(list_message_item_from_hash.calling_number_country_a3).to eq('USA')
      expect(list_message_item_from_hash.called_number_country_a3).to eq('USA')
      expect(list_message_item_from_hash.product).to eq('MESSAGING-V2')
      expect(list_message_item_from_hash.location).to eq('loc-1')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(list_message_item_values.to_s).to eq('{:messageId=>"1589228074636lm4k2je7j7jklbn2", :accountId=>"9900000", :sourceTn=>"+19195554321", :destinationTn=>"+19195551234", :messageStatus=>"DELIVERED", :messageDirection=>"OUTBOUND", :messageType=>"sms", :segmentCount=>1, :errorCode=>0, :receiveTime=>"2022-06-16T13:15:07.160Z", :carrierName=>"verizon", :messageSize=>27, :messageLength=>18, :attachmentCount=>0, :recipientCount=>1, :campaignClass=>"T", :campaignId=>"CABC123", :bwLatency=>1, :carrierLatency=>2, :callingNumberCountryA3=>"USA", :calledNumberCountryA3=>"USA", :product=>"MESSAGING-V2", :location=>"loc-1"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(list_message_item_default.eql?(Bandwidth::ListMessageItem.new)).to be true
      expect(list_message_item_default.eql?(list_message_item_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(list_message_item_values.to_body).to eq({
        messageId: '1589228074636lm4k2je7j7jklbn2',
        accountId: '9900000',
        sourceTn: '+19195554321',
        destinationTn: '+19195551234',
        messageStatus: Bandwidth::MessageStatusEnum::DELIVERED,
        messageDirection: Bandwidth::ListMessageDirectionEnum::OUTBOUND,
        messageType: Bandwidth::MessageTypeEnum::SMS,
        segmentCount: 1,
        errorCode: 0,
        receiveTime: '2022-06-16T13:15:07.160Z',
        carrierName: 'verizon',
        messageSize: 27,
        messageLength: 18,
        attachmentCount: 0,
        recipientCount: 1,
        campaignClass: 'T',
        campaignId: 'CABC123',
        bwLatency: 1,
        carrierLatency: 2,
        callingNumberCountryA3: 'USA',
        calledNumberCountryA3: 'USA',
        product: 'MESSAGING-V2',
        location: 'loc-1'
      })
    end
  end
end
