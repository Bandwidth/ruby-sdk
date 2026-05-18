# Unit tests for Bandwidth::BrtcErrorSource
describe Bandwidth::BrtcErrorSource do
  let(:brtc_error_source_default) { Bandwidth::BrtcErrorSource.new }
  let(:brtc_error_source_values) { Bandwidth::BrtcErrorSource.new({
    parameter: 'limit',
    field: 'phoneNumber',
    header: 'Authorization',
    reference: '/accounts/9900000'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::BrtcErrorSource.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::BrtcErrorSource.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::BrtcErrorSource.acceptable_attributes).to eq(Bandwidth::BrtcErrorSource.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::BrtcErrorSource.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of BrtcErrorSource created by the build_from_hash method' do
      brtc_error_source_from_hash = Bandwidth::BrtcErrorSource.build_from_hash({
        parameter: 'limit',
        field: 'phoneNumber',
        header: 'Authorization',
        reference: '/accounts/9900000'
      })
      expect(brtc_error_source_from_hash).to be_instance_of(Bandwidth::BrtcErrorSource)
      expect(brtc_error_source_from_hash.parameter).to eq('limit')
      expect(brtc_error_source_from_hash.field).to eq('phoneNumber')
      expect(brtc_error_source_from_hash.header).to eq('Authorization')
      expect(brtc_error_source_from_hash.reference).to eq('/accounts/9900000')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(brtc_error_source_values.to_s).to eq('{:parameter=>"limit", :field=>"phoneNumber", :header=>"Authorization", :reference=>"/accounts/9900000"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(brtc_error_source_default.eql?(Bandwidth::BrtcErrorSource.new)).to be true
      expect(brtc_error_source_default.eql?(brtc_error_source_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(brtc_error_source_values.to_body).to eq({
        parameter: 'limit',
        field: 'phoneNumber',
        header: 'Authorization',
        reference: '/accounts/9900000'
      })
    end
  end
end
