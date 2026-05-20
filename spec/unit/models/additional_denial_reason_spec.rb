# Unit tests for Bandwidth::AdditionalDenialReason
describe Bandwidth::AdditionalDenialReason do
  let(:additional_denial_reason_default) { Bandwidth::AdditionalDenialReason.new({
    status_code: 100,
    reason: 'baseline',
    resubmit_allowed: false
  }) }
  let(:additional_denial_reason_values) { Bandwidth::AdditionalDenialReason.new({
    status_code: 200,
    reason: 'reason text',
    resubmit_allowed: true
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::AdditionalDenialReason.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::AdditionalDenialReason.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::AdditionalDenialReason.acceptable_attributes).to eq(Bandwidth::AdditionalDenialReason.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::AdditionalDenialReason.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of AdditionalDenialReason created by the build_from_hash method' do
      additional_denial_reason_from_hash = Bandwidth::AdditionalDenialReason.build_from_hash({
        statusCode: 200,
        reason: 'reason text',
        resubmitAllowed: true
      })
      expect(additional_denial_reason_from_hash).to be_instance_of(Bandwidth::AdditionalDenialReason)
      expect(additional_denial_reason_from_hash.status_code).to eq(200)
      expect(additional_denial_reason_from_hash.reason).to eq('reason text')
      expect(additional_denial_reason_from_hash.resubmit_allowed).to eq(true)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(additional_denial_reason_values.to_s).to eq('{:statusCode=>200, :reason=>"reason text", :resubmitAllowed=>true}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      additional_denial_reason_equal = Bandwidth::AdditionalDenialReason.new({
        status_code: 100,
        reason: 'baseline',
        resubmit_allowed: false
      })
      expect(additional_denial_reason_default.eql?(additional_denial_reason_equal)).to be true
      expect(additional_denial_reason_default.eql?(additional_denial_reason_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(additional_denial_reason_values.to_body).to eq({
        statusCode: 200,
        reason: 'reason text',
        resubmitAllowed: true
      })
    end
  end

  describe 'custom attribute writers' do
    it '#status_code=' do
      expect {
        Bandwidth::AdditionalDenialReason.new({ status_code: nil, reason: 'a', resubmit_allowed: false })
      }.to raise_error(ArgumentError, 'status_code cannot be nil')
    end

    it '#reason=' do
      expect {
        Bandwidth::AdditionalDenialReason.new({ status_code: 1, reason: nil, resubmit_allowed: false })
      }.to raise_error(ArgumentError, 'reason cannot be nil')
    end

    it '#resubmit_allowed=' do
      expect {
        Bandwidth::AdditionalDenialReason.new({ status_code: 1, reason: 'a', resubmit_allowed: nil })
      }.to raise_error(ArgumentError, 'resubmit_allowed cannot be nil')
    end
  end
end
