# Unit tests for Bandwidth::RbmMessageContentText
describe Bandwidth::RbmMessageContentText do
  let(:reply_action) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }
  let(:rbm_message_content_text_default) { Bandwidth::RbmMessageContentText.new({
    text: 'baseline'
  }) }
  let(:rbm_message_content_text_values) { Bandwidth::RbmMessageContentText.new({
    text: 'Hello world',
    suggestions: [reply_action]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmMessageContentText.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmMessageContentText.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmMessageContentText.acceptable_attributes).to eq(Bandwidth::RbmMessageContentText.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmMessageContentText.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmMessageContentText created by the build_from_hash method' do
      rbm_message_content_text_from_hash = Bandwidth::RbmMessageContentText.build_from_hash({
        text: 'Hello world',
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
      expect(rbm_message_content_text_from_hash).to be_instance_of(Bandwidth::RbmMessageContentText)
      expect(rbm_message_content_text_from_hash.text).to eq('Hello world')
      expect(rbm_message_content_text_from_hash.suggestions.first).to be_instance_of(Bandwidth::RbmActionBase)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_message_content_text_values.to_s).to eq('{:text=>"Hello world", :suggestions=>[{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      rbm_message_content_text_equal = Bandwidth::RbmMessageContentText.new({
        text: 'baseline'
      })
      expect(rbm_message_content_text_default.eql?(rbm_message_content_text_equal)).to be true
      expect(rbm_message_content_text_default.eql?(rbm_message_content_text_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_message_content_text_values.to_body).to eq({
        text: 'Hello world',
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#text=' do
      expect {
        Bandwidth::RbmMessageContentText.new({ text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::RbmMessageContentText.new({ text: 'a' * 3271 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 3270.')
    end

    it '#suggestions=' do
      expect {
        rbm_message_content_text_values.suggestions = nil
      }.to raise_error(ArgumentError, 'suggestions cannot be nil')

      expect {
        rbm_message_content_text_values.suggestions = [reply_action] * 12
      }.to raise_error(ArgumentError, 'invalid value for "suggestions", number of items must be less than or equal to 11.')
    end
  end
end
