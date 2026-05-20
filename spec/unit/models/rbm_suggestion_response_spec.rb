# Unit tests for Bandwidth::RbmSuggestionResponse
describe Bandwidth::RbmSuggestionResponse do
  let(:rbm_suggestion_response_default) { Bandwidth::RbmSuggestionResponse.new }
  let(:rbm_suggestion_response_values) { Bandwidth::RbmSuggestionResponse.new({
    text: 'Yes',
    postback_data: 'reply_yes'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::RbmSuggestionResponse.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::RbmSuggestionResponse.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::RbmSuggestionResponse.acceptable_attributes).to eq(Bandwidth::RbmSuggestionResponse.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::RbmSuggestionResponse.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of RbmSuggestionResponse created by the build_from_hash method' do
      rbm_suggestion_response_from_hash = Bandwidth::RbmSuggestionResponse.build_from_hash({
        text: 'Yes',
        postbackData: 'reply_yes'
      })
      expect(rbm_suggestion_response_from_hash).to be_instance_of(Bandwidth::RbmSuggestionResponse)
      expect(rbm_suggestion_response_from_hash.text).to eq('Yes')
      expect(rbm_suggestion_response_from_hash.postback_data).to eq('reply_yes')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(rbm_suggestion_response_values.to_s).to eq('{:text=>"Yes", :postbackData=>"reply_yes"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      expect(rbm_suggestion_response_default.eql?(Bandwidth::RbmSuggestionResponse.new)).to be true
      expect(rbm_suggestion_response_default.eql?(rbm_suggestion_response_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(rbm_suggestion_response_values.to_body).to eq({
        text: 'Yes',
        postbackData: 'reply_yes'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#postback_data=' do
      expect {
        rbm_suggestion_response_values.postback_data = nil
      }.to raise_error(ArgumentError, 'postback_data cannot be nil')

      expect {
        rbm_suggestion_response_values.postback_data = 'a' * 2049
      }.to raise_error(ArgumentError, 'invalid value for "postback_data", the character length must be smaller than or equal to 2048.')
    end
  end
end
