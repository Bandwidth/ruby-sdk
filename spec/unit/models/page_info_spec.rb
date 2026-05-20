# Unit tests for Bandwidth::PageInfo
describe Bandwidth::PageInfo do
  let(:page_info_default) { Bandwidth::PageInfo.new }
  let(:page_info_values) { Bandwidth::PageInfo.new({
    prev_page: 'https://example.com/prev',
    next_page: 'https://example.com/next',
    prev_page_token: 'prev-token',
    next_page_token: 'next-token'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::PageInfo.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::PageInfo.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::PageInfo.acceptable_attributes).to eq(Bandwidth::PageInfo.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::PageInfo.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of PageInfo created by the build_from_hash method' do
      page_info_from_hash = Bandwidth::PageInfo.build_from_hash({
        prevPage: 'https://example.com/prev',
        nextPage: 'https://example.com/next',
        prevPageToken: 'prev-token',
        nextPageToken: 'next-token'
      })
      expect(page_info_from_hash).to be_instance_of(Bandwidth::PageInfo)
      expect(page_info_from_hash.prev_page).to eq('https://example.com/prev')
      expect(page_info_from_hash.next_page).to eq('https://example.com/next')
      expect(page_info_from_hash.prev_page_token).to eq('prev-token')
      expect(page_info_from_hash.next_page_token).to eq('next-token')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(page_info_values.to_s).to eq('{:prevPage=>"https://example.com/prev", :nextPage=>"https://example.com/next", :prevPageToken=>"prev-token", :nextPageToken=>"next-token"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(page_info_default.eql?(Bandwidth::PageInfo.new)).to be true
      expect(page_info_default.eql?(page_info_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(page_info_values.to_body).to eq({
        prevPage: 'https://example.com/prev',
        nextPage: 'https://example.com/next',
        prevPageToken: 'prev-token',
        nextPageToken: 'next-token'
      })
    end
  end
end
