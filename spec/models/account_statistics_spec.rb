# Unit tests for Bandwidth::AccountStatistics
describe Bandwidth::AccountStatistics do
  let(:account_statistics_default) { Bandwidth::AccountStatistics.new }
  let(:account_statistics_values) { Bandwidth::AccountStatistics.new({ current_call_queue_size: 10, max_call_queue_size: 100 }) }
  let(:account_statistics_from_hash) { Bandwidth::AccountStatistics.build_from_hash({ currentCallQueueSize: 10, maxCallQueueSize: 100 }) }

  describe '#initialize' do
    it 'validates instance of AccountStatistics initialized with attributes passed in' do
      expect(account_statistics_values).to be_instance_of(Bandwidth::AccountStatistics)
      expect(account_statistics_values.current_call_queue_size).to eq(10)
      expect(account_statistics_values.max_call_queue_size).to eq(100)
    end

    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::AccountStatistics.new([])
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::AccountStatistics.new({ invalid: true })
      }.to raise_error { |e|
        expect(e).to be_instance_of(ArgumentError)
      }
    end
  end

  describe 'attributes' do   
    it 'can set and retrieve attributes' do
      account_statistics_default.current_call_queue_size = 10
      account_statistics_default.max_call_queue_size = 100
      
      expect(account_statistics_values.current_call_queue_size).to eq(10)
      expect(account_statistics_values.max_call_queue_size).to eq(100)
      expect(account_statistics_default.current_call_queue_size).to eq(10)
      expect(account_statistics_default.max_call_queue_size).to eq(100)
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of AccountStatistics created by the build_from_hash method' do
      expect(account_statistics_from_hash).to be_instance_of(Bandwidth::AccountStatistics)
      expect(account_statistics_from_hash.current_call_queue_size).to eq(10)
      expect(account_statistics_from_hash.max_call_queue_size).to eq(100)
    end
  end

  describe '#list_invalid_properties' do
    it 'returns list of invalid properties' do
      expect(account_statistics_default.list_invalid_properties).to eq([])
    end
  end

  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(account_statistics_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(account_statistics_default.to_s).to eq('{}')
    end
  end

  describe '#valid?' do
    it 'validates instances with and without attributes set' do
      expect(account_statistics_default).to be_valid
      expect(account_statistics_values).to be_valid
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(account_statistics_from_hash.eql?(account_statistics_values)).to be(true)
      expect(account_statistics_default.eql?(account_statistics_values)).to be(false)
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(account_statistics_values.to_body).to eq({ currentCallQueueSize: 10, maxCallQueueSize: 100 })
    end
  end
end
