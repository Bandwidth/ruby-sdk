# Unit tests for Bandwidth::RbmSession
describe Bandwidth::RbmSession do
  let(:rbm_session_default) { Bandwidth::RbmSession.new({
    can_initiate: true
  }) }
  let(:rbm_session_values) { Bandwidth::RbmSession.new({
    can_initiate: false,
    id: '0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d',
    type: 'INTERACTIVE_SESSION',
    start_time: '2026-08-06T09:59:55Z',
    end_time: '2026-08-07T09:59:55Z'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmSession.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmSession.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmSession.acceptable_attributes).to eq(Bandwidth::RbmSession.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be the set of nullable fields' do
      expect(Bandwidth::RbmSession.openapi_nullable).to eq(Set.new([
        :'id',
        :'type',
        :'start_time',
        :'end_time'
      ]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmSession created by the build_from_hash method' do
      rbm_session_from_hash = Bandwidth::RbmSession.build_from_hash({
        canInitiate: false,
        id: '0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d',
        type: 'INTERACTIVE_SESSION',
        startTime: '2026-08-06T09:59:55Z',
        endTime: '2026-08-07T09:59:55Z'
      })
      expect(rbm_session_from_hash).to be_instance_of(Bandwidth::RbmSession)
      expect(rbm_session_from_hash.can_initiate).to be false
      expect(rbm_session_from_hash.id).to eq('0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d')
      expect(rbm_session_from_hash.type).to eq('INTERACTIVE_SESSION')
      expect(rbm_session_from_hash.start_time).to eq(Time.parse('2026-08-06T09:59:55Z'))
      expect(rbm_session_from_hash.end_time).to eq(Time.parse('2026-08-07T09:59:55Z'))
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_session_values.to_s).to eq({ :canInitiate => false, :id => '0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d', :type => 'INTERACTIVE_SESSION', :startTime => '2026-08-06T09:59:55Z', :endTime => '2026-08-07T09:59:55Z' }.to_s)
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(rbm_session_default.eql?(Bandwidth::RbmSession.new({ can_initiate: true }))).to be true
      expect(rbm_session_default.eql?(rbm_session_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_session_values.to_body).to eq({
        canInitiate: false,
        id: '0f5a3b9c-2d4e-4f6a-8b1c-7e9d0a2b3c4d',
        type: 'INTERACTIVE_SESSION',
        startTime: '2026-08-06T09:59:55Z',
        endTime: '2026-08-07T09:59:55Z'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#can_initiate=' do
      expect {
        rbm_session_values.can_initiate = nil
      }.to raise_error(ArgumentError, 'can_initiate cannot be nil')
    end
  end
end
