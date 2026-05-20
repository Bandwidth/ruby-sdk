# Unit tests for Bandwidth::Page
describe Bandwidth::Page do
  let(:page_default) { Bandwidth::Page.new({
    page_size: 25
  }) }
  let(:page_values) { Bandwidth::Page.new({
    page_size: 100,
    total_elements: 250,
    total_pages: 3,
    page_number: 1
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::Page.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::Page.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::Page.acceptable_attributes).to eq(Bandwidth::Page.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::Page.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of Page created by the build_from_hash method' do
      page_from_hash = Bandwidth::Page.build_from_hash({
        pageSize: 100,
        totalElements: 250,
        totalPages: 3,
        pageNumber: 1
      })
      expect(page_from_hash).to be_instance_of(Bandwidth::Page)
      expect(page_from_hash.page_size).to eq(100)
      expect(page_from_hash.total_elements).to eq(250)
      expect(page_from_hash.total_pages).to eq(3)
      expect(page_from_hash.page_number).to eq(1)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(page_values.to_s).to eq('{:pageSize=>100, :totalElements=>250, :totalPages=>3, :pageNumber=>1}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      page_equal = Bandwidth::Page.new({ page_size: 25 })
      expect(page_default.eql?(page_equal)).to be true
      expect(page_default.eql?(page_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(page_values.to_body).to eq({
        pageSize: 100,
        totalElements: 250,
        totalPages: 3,
        pageNumber: 1
      })
    end
  end

  describe 'custom attribute writers' do
    it '#page_size=' do
      expect {
        Bandwidth::Page.new({ page_size: nil })
      }.to raise_error(ArgumentError, 'page_size cannot be nil')

      expect {
        Bandwidth::Page.new({ page_size: -1 })
      }.to raise_error(ArgumentError, 'invalid value for "page_size", must be greater than or equal to 0.')
    end

    it '#total_elements=' do
      expect {
        page_values.total_elements = nil
      }.to raise_error(ArgumentError, 'total_elements cannot be nil')

      expect {
        page_values.total_elements = -1
      }.to raise_error(ArgumentError, 'invalid value for "total_elements", must be greater than or equal to 0.')
    end

    it '#total_pages=' do
      expect {
        page_values.total_pages = nil
      }.to raise_error(ArgumentError, 'total_pages cannot be nil')

      expect {
        page_values.total_pages = -1
      }.to raise_error(ArgumentError, 'invalid value for "total_pages", must be greater than or equal to 0.')
    end

    it '#page_number=' do
      expect {
        page_values.page_number = nil
      }.to raise_error(ArgumentError, 'page_number cannot be nil')

      expect {
        page_values.page_number = -1
      }.to raise_error(ArgumentError, 'invalid value for "page_number", must be greater than or equal to 0.')
    end
  end
end
