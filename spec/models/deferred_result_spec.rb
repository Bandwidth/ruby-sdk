# Unit tests for Bandwidth::DeferredResult
describe Bandwidth::DeferredResult do
  let(:deferred_result_default) { Bandwidth::DeferredResult.new }
  let(:deferred_result_values) { Bandwidth::DeferredResult.new({
    result: { key: 'value' },
    set_or_expired: true
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::DeferredResult.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::DeferredResult.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::DeferredResult.acceptable_attributes).to eq(Bandwidth::DeferredResult.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::DeferredResult.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of DeferredResult created by the build_from_hash method' do
      deferred_result_from_hash = Bandwidth::DeferredResult.build_from_hash({
        result: { key: 'value' },
        setOrExpired: true
      })
      expect(deferred_result_from_hash).to be_instance_of(Bandwidth::DeferredResult)
      expect(deferred_result_from_hash.result).to eq({ key: 'value' })
      expect(deferred_result_from_hash.set_or_expired).to be true
    end
  end
  
  describe '#hash' do
    it 'returns a hash code according to attributes' do
      expect(deferred_result_default.hash).to be_instance_of(Integer)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(deferred_result_values.to_s).to eq('{:result=>{:key=>"value"}, :setOrExpired=>true}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(deferred_result_default.eql?(Bandwidth::DeferredResult.new)).to be true
      expect(deferred_result_default.eql?(deferred_result_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(deferred_result_values.to_body).to eq({
        result: { key: 'value' },
        setOrExpired: true
      })
    end
  end
end
