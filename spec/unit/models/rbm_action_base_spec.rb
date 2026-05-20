# Unit tests for Bandwidth::RbmActionBase
describe Bandwidth::RbmActionBase do
  let(:rbm_action_base_default) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'baseline',
    postback_data: 'baseline_postback'
  }) }
  let(:rbm_action_base_values) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmActionBase.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmActionBase.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmActionBase.acceptable_attributes).to eq(Bandwidth::RbmActionBase.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmActionBase.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmActionBase created by the build_from_hash method' do
      rbm_action_base_from_hash = Bandwidth::RbmActionBase.build_from_hash({
        type: Bandwidth::RbmActionTypeEnum::REPLY,
        text: 'Yes',
        postbackData: 'reply_yes'
      })
      expect(rbm_action_base_from_hash).to be_instance_of(Bandwidth::RbmActionBase)
      expect(rbm_action_base_from_hash.type).to eq(Bandwidth::RbmActionTypeEnum::REPLY)
      expect(rbm_action_base_from_hash.text).to eq('Yes')
      expect(rbm_action_base_from_hash.postback_data).to eq('reply_yes')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_action_base_values.to_s).to eq('{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_action_base_equal = Bandwidth::RbmActionBase.new({
        type: Bandwidth::RbmActionTypeEnum::REPLY,
        text: 'baseline',
        postback_data: 'baseline_postback'
      })
      expect(rbm_action_base_default.eql?(rbm_action_base_equal)).to be true
      expect(rbm_action_base_default.eql?(rbm_action_base_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_action_base_values.to_body).to eq({
        type: Bandwidth::RbmActionTypeEnum::REPLY,
        text: 'Yes',
        postbackData: 'reply_yes'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#type=' do
      expect {
        Bandwidth::RbmActionBase.new({ type: nil })
      }.to raise_error(ArgumentError, 'type cannot be nil')
    end

    it '#text=' do
      expect {
        Bandwidth::RbmActionBase.new({ type: 'REPLY', text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::RbmActionBase.new({ type: 'REPLY', text: 'a' * 26 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 25.')
    end

    it '#postback_data=' do
      expect {
        Bandwidth::RbmActionBase.new({ type: 'REPLY', text: 'a', postback_data: nil })
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        Bandwidth::RbmActionBase.new({ type: 'REPLY', text: 'a', postback_data: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end
  end
end
