# Unit tests for Bandwidth::SmsMessageContent
describe Bandwidth::SmsMessageContent do
  let(:sms_message_content_default) { Bandwidth::SmsMessageContent.new({
    text: 'baseline'
  }) }
  let(:sms_message_content_values) { Bandwidth::SmsMessageContent.new({
    text: 'Hello world'
  }) }

  describe '#initialize' do
    it 'causes an ArgumentError by passing an Array to the initialize method' do
      expect {
        Bandwidth::SmsMessageContent.new([])
      }.to raise_error(ArgumentError)
    end

    it 'causes an ArgumentError by passing an invalid attribute to the initialize method' do
      expect {
        Bandwidth::SmsMessageContent.new({ invalid: true })
      }.to raise_error(ArgumentError)
    end
  end

  describe '#acceptable_attributes' do
    it 'expects acceptable JSON attributes to be those in the attribute map' do
      expect(Bandwidth::SmsMessageContent.acceptable_attributes).to eq(Bandwidth::SmsMessageContent.attribute_map.values)
    end
  end

  describe '#openapi_nullable' do
    it 'expects nullable attributes to be an empty set' do
      expect(Bandwidth::SmsMessageContent.openapi_nullable).to eq(Set.new([]))
    end
  end

  describe '#build_from_hash' do
    it 'validates instance of SmsMessageContent created by the build_from_hash method' do
      sms_message_content_from_hash = Bandwidth::SmsMessageContent.build_from_hash({
        text: 'Hello world'
      })
      expect(sms_message_content_from_hash).to be_instance_of(Bandwidth::SmsMessageContent)
      expect(sms_message_content_from_hash.text).to eq('Hello world')
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the object' do
      expect(sms_message_content_values.to_s).to eq('{:text=>"Hello world"}')
    end
  end

  describe '#eq? #==' do
    it 'returns true/false when comparing objects' do
      sms_message_content_equal = Bandwidth::SmsMessageContent.new({
        text: 'baseline'
      })
      expect(sms_message_content_default.eql?(sms_message_content_equal)).to be true
      expect(sms_message_content_default.eql?(sms_message_content_values)).to be false
    end
  end

  describe '#to_body #to_hash' do
    it 'returns a hash representation of the object' do
      expect(sms_message_content_values.to_body).to eq({
        text: 'Hello world'
      })
    end
  end

  describe 'custom attribute writers' do
    it '#text=' do
      expect {
        Bandwidth::SmsMessageContent.new({ text: nil })
      }.to raise_error(ArgumentError, 'text cannot be nil')

      expect {
        Bandwidth::SmsMessageContent.new({ text: 'a' * 2049 })
      }.to raise_error(ArgumentError, 'invalid value for "text", the character length must be smaller than or equal to 2048.')
    end
  end
end
