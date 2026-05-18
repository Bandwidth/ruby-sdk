# Unit tests for Bandwidth::MessagesList
describe Bandwidth::MessagesList do
  let(:page_info) { Bandwidth::PageInfo.new({
    prev_page: 'https://example.com/prev',
    next_page: 'https://example.com/next',
    prev_page_token: 'prev-token',
    next_page_token: 'next-token'
  }) }
  let(:list_message_item) { Bandwidth::ListMessageItem.new({ message_id: 'abc-123', message_length: 10 }) }
  let(:messages_list_default) { Bandwidth::MessagesList.new }
  let(:messages_list_values) { Bandwidth::MessagesList.new({
    total_count: 1,
    page_info: page_info,
    messages: [list_message_item]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::MessagesList.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::MessagesList.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::MessagesList.acceptable_attributes).to eq(Bandwidth::MessagesList.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::MessagesList.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of MessagesList created by the build_from_hash method' do
      messages_list_from_hash = Bandwidth::MessagesList.build_from_hash({
        totalCount: 1,
        pageInfo: { prevPage: 'https://example.com/prev', nextPage: 'https://example.com/next', prevPageToken: 'prev-token', nextPageToken: 'next-token' },
        messages: [{ messageId: 'abc-123', messageLength: 10 }]
      })
      expect(messages_list_from_hash).to be_instance_of(Bandwidth::MessagesList)
      expect(messages_list_from_hash.total_count).to eq(1)
      expect(messages_list_from_hash.page_info).to be_instance_of(Bandwidth::PageInfo)
      expect(messages_list_from_hash.messages.first).to be_instance_of(Bandwidth::ListMessageItem)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(messages_list_values.to_s).to eq('{:totalCount=>1, :pageInfo=>{:prevPage=>"https://example.com/prev", :nextPage=>"https://example.com/next", :prevPageToken=>"prev-token", :nextPageToken=>"next-token"}, :messages=>[{:messageId=>"abc-123", :messageLength=>10}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(messages_list_default.eql?(Bandwidth::MessagesList.new)).to be true
      expect(messages_list_default.eql?(messages_list_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(messages_list_values.to_body).to eq({
        totalCount: 1,
        pageInfo: { prevPage: 'https://example.com/prev', nextPage: 'https://example.com/next', prevPageToken: 'prev-token', nextPageToken: 'next-token' },
        messages: [{ messageId: 'abc-123', messageLength: 10 }]
      })
    end
  end
end
