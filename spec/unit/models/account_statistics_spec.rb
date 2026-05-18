# Unit tests for Bandwidth::AccountStatistics
describe Bandwidth::AccountStatistics do
  let(:account_statistics_default) { Bandwidth::AccountStatistics.new }
  let(:account_statistics_values) { Bandwidth::AccountStatistics.new({
    current_call_queue_size: 1,
    max_call_queue_size: 100
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::AccountStatistics.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::AccountStatistics.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::AccountStatistics.acceptable_attributes).to eq(Bandwidth::AccountStatistics.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::AccountStatistics.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of AccountStatistics created by the build_from_hash method' do
      account_statistics_from_hash = Bandwidth::AccountStatistics.build_from_hash({
        currentCallQueueSize: 1,
        maxCallQueueSize: 100
      })
      expect(account_statistics_from_hash).to be_instance_of(Bandwidth::AccountStatistics)
      expect(account_statistics_from_hash.current_call_queue_size).to eq(1)
      expect(account_statistics_from_hash.max_call_queue_size).to eq(100)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(account_statistics_values.to_s).to eq('{:currentCallQueueSize=>1, :maxCallQueueSize=>100}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(account_statistics_default.eql?(Bandwidth::AccountStatistics.new)).to be true
      expect(account_statistics_default.eql?(account_statistics_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(account_statistics_values.to_body).to eq({
        currentCallQueueSize: 1,
        maxCallQueueSize: 100
      })
    end
  end
end
