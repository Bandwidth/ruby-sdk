# Unit tests for Bandwidth::RbmCardContent
describe Bandwidth::RbmCardContent do
  let(:reply_action) { Bandwidth::RbmActionBase.new({
    type: Bandwidth::RbmActionTypeEnum::REPLY,
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }
  let(:rbm_card_content_default) { Bandwidth::RbmCardContent.new }
  let(:rbm_card_content_values) { Bandwidth::RbmCardContent.new({
    title: 'Card Title',
    description: 'Card Description',
    media: Bandwidth::RbmCardContentMedia.new({
      file_url: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
      height: Bandwidth::RbmMediaHeightEnum::MEDIUM
    }),
    suggestions: [reply_action]
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmCardContent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmCardContent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmCardContent.acceptable_attributes).to eq(Bandwidth::RbmCardContent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmCardContent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmCardContent created by the build_from_hash method' do
      rbm_card_content_from_hash = Bandwidth::RbmCardContent.build_from_hash({
        title: 'Card Title',
        description: 'Card Description',
        media: {
          fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
          height: Bandwidth::RbmMediaHeightEnum::MEDIUM
        },
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
      expect(rbm_card_content_from_hash).to be_instance_of(Bandwidth::RbmCardContent)
      expect(rbm_card_content_from_hash.title).to eq('Card Title')
      expect(rbm_card_content_from_hash.description).to eq('Card Description')
      expect(rbm_card_content_from_hash.media).to be_instance_of(Bandwidth::RbmCardContentMedia)
      expect(rbm_card_content_from_hash.suggestions.first).to be_instance_of(Bandwidth::RbmActionBase)
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_card_content_values.to_s).to eq('{:title=>"Card Title", :description=>"Card Description", :media=>{:fileUrl=>"https://dev.bandwidth.com/images/bandwidth-logo.png", :height=>"MEDIUM"}, :suggestions=>[{:type=>"REPLY", :text=>"Yes", :postbackData=>"reply_yes"}]}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(rbm_card_content_default.eql?(Bandwidth::RbmCardContent.new)).to be true
      expect(rbm_card_content_default.eql?(rbm_card_content_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_card_content_values.to_body).to eq({
        title: 'Card Title',
        description: 'Card Description',
        media: {
          fileUrl: 'https://dev.bandwidth.com/images/bandwidth-logo.png',
          height: Bandwidth::RbmMediaHeightEnum::MEDIUM
        },
        suggestions: [{ type: Bandwidth::RbmActionTypeEnum::REPLY, text: 'Yes', postbackData: 'reply_yes' }]
      })
    end
  end

  describe 'custom attribute writers' do
    it '#title=' do
      expect {
        Bandwidth::RbmCardContent.new({ title: nil })
      }.to raise_error(ArgumentError, 'title cannot be nil')

      expect {
        Bandwidth::RbmCardContent.new({ title: 'a' * 201 })
      }.to raise_error(ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 200.')
    end

    it '#description=' do
      expect {
        Bandwidth::RbmCardContent.new({ description: nil })
      }.to raise_error(ArgumentError, 'description cannot be nil')

      expect {
        Bandwidth::RbmCardContent.new({ description: 'a' * 2001 })
      }.to raise_error(ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 2000.')
    end

    it '#suggestions=' do
      expect {
        rbm_card_content_values.suggestions = nil
      }.to raise_error(ArgumentError, 'suggestions cannot be nil')

      expect {
        rbm_card_content_values.suggestions = [reply_action] * 5
      }.to raise_error(ArgumentError, 'invalid value for "suggestions", number of items must be less than or equal to 4.')
    end
  end
end
